import 'package:flutter/material.dart';

class Nextquestionbtn extends StatelessWidget {
  const Nextquestionbtn({super.key,required this.Nextquestion});
 final VoidCallback Nextquestion;
   @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Nextquestion,
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color:Colors.blue[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text('Next Question',
      textAlign: TextAlign.center,
      ),
    ),
    );
  }
}