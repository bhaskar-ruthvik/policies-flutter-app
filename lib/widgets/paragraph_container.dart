import 'package:flutter/material.dart';
class ParagraphContainer extends StatefulWidget{
  const ParagraphContainer({super.key,required this.headings,required this.slugs});

  final List<String> headings;
  final List<String> slugs;

  @override
  State<ParagraphContainer> createState() => _ParagraphState();
}

class _ParagraphState extends State<ParagraphContainer>{ 
  int index = 0;

  @override
  Widget build(BuildContext context) {
      final headings = widget.headings;
      final paragraphs = widget.slugs;
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(headings[index],style: const TextStyle(fontSize: 26,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),textAlign: TextAlign.center,),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(paragraphs[index],style: TextStyle(
                      color: MediaQuery.of(context).platformBrightness==Brightness.dark ? Colors.white : Colors.black,
                      fontSize: 16
                    ),textAlign: TextAlign.justify),),
                const SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      heroTag: "Back",
                      onPressed: (){
                         setState(() {
                          index = index+1 % headings.length;
                        });
                      }, child: const Icon(Icons.arrow_back)),
                   
                    const SizedBox(width: 160,),
                       FloatingActionButton(
                        heroTag: "Forward",
                        onPressed: (){
                         setState(() {
                          index = index+1 % headings.length;
                        });
                      }, child: const Icon(Icons.arrow_forward)),
                    
                  ],
                )
              ],
            );
  }
}