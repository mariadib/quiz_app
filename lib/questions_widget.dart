import 'package:flutter/material.dart';
class QuestionsWidget extends StatelessWidget {
  const QuestionsWidget({super.key,required this.questions, required this.questionindex,required this.totalquestions});
  final String questions;
  final int questionindex;
  final int totalquestions;
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Text('Question: ${questionindex + 1}/$totalquestions: $questions',
      style: const TextStyle(
        fontSize: 24,
        color:Colors.blueGrey,
      ),
      ),
    );
  }
}