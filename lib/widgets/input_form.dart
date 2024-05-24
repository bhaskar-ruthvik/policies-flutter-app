import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:policies_app/models/Response.dart';
import 'package:policies_app/screens/answer_screen.dart';
import 'package:http/http.dart' as http;
 
class InputForm extends StatefulWidget{
  const InputForm({super.key});
  
  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
    Future<CustomResponse> fetchResponse(String question) async {
      print(question);
  var res = await http.post(
    Uri.parse('https://policies-app-backend.onrender.com/'),
    headers: {
     "Content-Type": "application/x-www-form-urlencoded",
    },
    encoding: Encoding.getByName('utf-8'),
    body: {"body": _question },
  );
   final body = jsonDecode(res.body);
 if(body=="null"){
  return const CustomResponse(type: "null", body: {"null" : "null"});
 }
 final resp = CustomResponse(type: body['type'], body: body['body']);
 return resp;
}
bool _loading = false;
  var _question = "";
  @override
  Widget build(BuildContext context) {
   return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0,0.0,24.0,24.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _question = value;
                   
                  });
  
                },
                decoration: InputDecoration(label: Text("Enter your question here")),
              ),
            ),
            SizedBox(height: 20,),
              SizedBox(
              height: 60.0,
              width: 160.0,
              child: ElevatedButton(
                child:!_loading ? const Row(
                children: [
                  Icon(Icons.question_answer),
                  SizedBox(width: 10,),
                  Text("Get Answer"),
                ],
              ) : const CircularProgressIndicator(),
              onPressed: () async {
                setState(() {
                  _loading = true;
                });
                final res = await fetchResponse(_question);
                setState(() {
                  _loading = false;
                });
                 if(res.type=="null"){ return; }

                else {
                  if(!context.mounted){return;}
                    Navigator.of(context).push(MaterialPageRoute(builder:(ctx){
              
                  return AnswerScreen(res: res);
                }));
                }
              },
              ),
            ),
          ],
        );
  }
}