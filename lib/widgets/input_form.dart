import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:policies_app/models/Response.dart';
import 'package:policies_app/screens/answer_screen.dart';
import 'package:http/http.dart' as http;
import 'package:policies_app/utils.dart';

const List<String> list = <String>['English', 'Hindi', 'Telugu', 'Tamil'];

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
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
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 24.0),
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(0.5, 2.0),
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 47),
              child: Column(
                children: [
                  Text('ASK A QUESTION', style: ThemeText.titleText2),
                  SizedBox(height: 49),
                  DropdownButtonFormField(
                    focusColor: Color(0xFF41495F),
                    dropdownColor: Colors.white,
                    decoration: InputDecoration(
                        focusColor: Color(0xFF41495F),
                        hoverColor: Color(0xFF41495F),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        label: Text("Choose Input Language",
                            style: TextStyle(color: Color(0xFF41495F)))),
                    value: dropdownValue,
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
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
                  SizedBox(height: 13),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        _question = value;
                      });
                    },
                    decoration: InputDecoration(
                        focusColor: Color(0xFF41495F),
                        hoverColor: Color(0xFF41495F),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        label: Text("Enter your question",
                            style: TextStyle(color: Color(0xFF41495F)))),
                  ),
                  SizedBox(height: 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        //see change
                        height: 40,
                        width: 115,
                        child: TextButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              backgroundColor: MaterialStateProperty.all(
                                  ThemeColours.primaryColor)),
                          child: !_loading
                              ? Text("Ask",
                                  style: TextStyle(color: Colors.white))
                              : CircularProgressIndicator(//change theme
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
