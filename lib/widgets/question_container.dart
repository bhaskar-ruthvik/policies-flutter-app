import 'package:flutter/material.dart';
import 'package:policies_app/widgets/custom_modal.dart';

class QuestionContainer extends StatefulWidget {
  const QuestionContainer({super.key, required this.questions});

  final List<dynamic> questions;

  @override
  State<QuestionContainer> createState() => _QuestionState();
}

class _QuestionState extends State<QuestionContainer> {
  int index = 0;

  void showModal(String info) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return CustomModal(info: info);
        });
  }

  @override
  Widget build(BuildContext context) {
    final questions = widget.questions;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question ${index + 1}:",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Color.fromARGB(255, 130, 122, 122)),
            padding: const EdgeInsets.all(8.0),
            child: Text(
              questions[index]["question"],
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.green,
              child: IconButton(
                  onPressed: () {
                    final yesActions = questions[index]["yes"];
                    if (yesActions['goto'] == -1) {
                      showModal(yesActions['content'].toString());
                    } else {
                      setState(() {
                        index = yesActions['goto'] as int;
                      });
                    }
                  },
                  icon: const Icon(Icons.check)),
            ),
            const SizedBox(
              width: 20,
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.red,
              child: IconButton(
                  onPressed: () {
                    final noActions = questions[index]["no"];
                    if ((noActions['goto'] as int) == -1) {
                      showModal(noActions['content'].toString());
                    } else {
                      setState(() {
                        index = noActions['goto'] as int;
                      });
                    }
                  },
                  icon: const Icon(Icons.close)),
            ),
          ],
        )
      ],
    );
  }
}
