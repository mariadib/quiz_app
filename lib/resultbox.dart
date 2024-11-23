import 'package:flutter/material.dart';
class Resultbox extends StatelessWidget {
  const Resultbox({Key?key,required this.score,required this.questionslength,required this.onClick}) :super(key: key);
final int questionslength; 
  final int score; 
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal,
      content:  Padding(
        padding: EdgeInsets.all(70),
       child:Column( 
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Score',
          style: TextStyle(color:Colors.white, fontSize:20),
          ),
          const SizedBox(height: 20),
          CircleAvatar(child: Text('$score/$questionslength', 
          style: TextStyle(fontSize: 20),
          ),
          radius: 60,
          backgroundColor: score==questionslength/2
          ?Colors.yellowAccent
          :score<questionslength/2
          ?Colors.redAccent
          :Colors.blueAccent,
          ),
          const SizedBox(height: 20),
          Text(score==questionslength/2
          ?'Almost There!'
          :score<questionslength/2
          ?'Try Again!'
          :'Excellent!',
          style: const TextStyle(color:Colors.white),
          ),
          const SizedBox(height: 25),
          GestureDetector(
            onTap: onClick,
            child: const Text(
              'Start Again',
              style: TextStyle(color: Colors.blue,fontSize: 20,letterSpacing:1 ),
            ),
          )
        ],
       )
       ),
    );
  }
}