import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:policies_app/models/Response.dart';
import 'package:policies_app/screens/answer_screen.dart';
import 'package:http/http.dart' as http;
import 'package:policies_app/utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

const List<String> list = <String>['English', 'Hindi', 'Telugu'];

String getLanguageCode(String language) {
  switch (language) {
    case 'English':
      return 'en';
    case 'Hindi':
      return 'hi';
    case 'Telugu':
      return 'te';
    default:
      return 'en'; // Default to English if no match found
  }
}

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

final recorder = AudioRecorder();

class _InputFormState extends State<InputForm> {
  Future<String> transcribeAudio(String audioPath, String languageCode) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://asr.iitm.ac.in/asr/v1/recognize/'),
    );

    request.fields['language'] = languageCode;
    request.files.add(await http.MultipartFile.fromPath('audio', audioPath));

    var res = await request.send();
    var responseData = await res.stream.bytesToString();
    final body = jsonDecode(responseData);

    if (body == "null") {
      throw Exception("Transcription failed");
    }

    return body['body']; // Assuming 'body' contains the transcribed text.
  }

  Future<CustomResponse> fetchResponse(String question) async {
    print(question);
    var res = await http.post(
      Uri.parse('https://policies-app-backend-nlvo.onrender.com'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {"body": _question},
    );
    final body = jsonDecode(res.body);
    if (body == "null") {
      return const CustomResponse(type: "null", body: {"null": "null"});
    }
    final resp = CustomResponse(type: body['type'], body: body['body']);
    return resp;
  }

  bool _loading = false;
  var _question = "";
  String dropdownValue = list.first;
  @override
  void _startRecording() async {
    var status = await Permission.microphone.request();
    if (status.isGranted) {
      // No need for `isGranted` after the await statement
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String filePath = '${appDocDir.path}/recording.wav';
      await recorder.start(
        const RecordConfig(),
        path: filePath,
      );
      print("Recording started");
    } else {
      print('Microphone permission denied');
    }
  }

  void _stopRecording() async {
    final path = await recorder.stop();
    await recorder.cancel();
    print("Recording saved at: $path");
    recorder.dispose();
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 24.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 47),
              child: Column(
                children: [
                  Text('ASK A QUESTION', style: ThemeText.titleText2),
                  const SizedBox(height: 50),
                  DropdownButtonFormField(
                    dropdownColor: Colors.white,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        label: Text("Choose Input Language",
                            style: ThemeText.bodyText)),
                    value: dropdownValue,
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 13),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onSubmitted: (value) {
                            //in attempt to make enter button on simulator work
                            setState(() {
                              _question = value;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              _question = value;
                            });
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              label: Text("Enter your question",
                                  style: ThemeText.bodyText)),
                        ),
                      ),
                      const SizedBox(width: 5),
                      IconButton(
                        iconSize: 20,
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            backgroundColor: MaterialStateProperty.all(
                                ThemeColours.primaryColor)),
                        icon: const Icon(Icons.mic, color: Colors.white),
                        onPressed: () async {
                          _startRecording();
                          await Future.delayed(
                            Duration(seconds: 5),
                          ); // Example: stop after 5 seconds
                          _stopRecording();

                          Directory appDocDir =
                              await getApplicationDocumentsDirectory();
                          String audioPath = '${appDocDir.path}/recording.wav';
                          String languageCode = getLanguageCode(dropdownValue);
                          try {
                            String transcription =
                                await transcribeAudio(audioPath, languageCode);

                            // Step 2: Send the transcription to the Render backend
                            final res = await fetchResponse(transcription);

                            print("Request sent successfully");
                          } catch (error) {
                            print('Error: $error');
                          }
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        //see change
                        height: 40,
                        width: 115,
                        child: GestureDetector(
                          //in attempt to make enter button on simulator work
                          onTap: () {
                            setState(() {
                              _loading = true;
                            });
                          },
                          child: IconButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                backgroundColor: MaterialStateProperty.all(
                                    ThemeColours.primaryColor)),
                            icon: !_loading
                                ? const Icon(Icons.arrow_forward_outlined,
                                    color: Colors.white)
                                : const CircularProgressIndicator(//change theme
                                    ),
                            onPressed: () async {
                              setState(() {
                                _loading = true;
                              });
                              final res = await fetchResponse(_question);
                              setState(() {
                                _loading = false;
                              });
                              if (res.type == "null") {
                                return;
                              } else {
                                if (!context.mounted) {
                                  return;
                                }
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (ctx) {
                                  return AnswerScreen(res: res);
                                }));
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
