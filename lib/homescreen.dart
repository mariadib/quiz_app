import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/questions_widget.dart';
import 'package:quiz_app/nextquestionbtn.dart';
import 'package:quiz_app/optioncard.dart';
import 'package:quiz_app/resultbox.dart';
class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  _homeScreenState createState() { return _homeScreenState();
  }
}

class _homeScreenState extends State<homeScreen> {
  final List<Questions> _questions=[
    Questions(
      id: '1',
      title: 'What is the capital of Lebanon?',
      options:{'Saida':false,'Jbeil':false,'Beirut':true,'Tripoli':false}
      ),
      Questions(
      id: '2',
      title: 'What is the closest planet to the sun?',
      options:{'Mercury':true,'Earth':false,'Jupiter':false,'Venus':false}
      ),
      Questions(
      id: '3',
      title: 'Who is the inventor of computer operating systems:Windows?',
      options:{'Steve Jobs':false,'Elon Musk':false,'Larry Page':false,'Bill Gates':true,}
      ),
      Questions(
      id: '4',
      title: 'In which city the Statue of Liberty is located?',
      options:{'Los Angeles':false,'Washington':false,'New York':true,'Chicago':false}
      ),
      Questions(
      id: '5',
      title: 'The opposite of Dark is:',
      options:{'Moon':false,'Light':true,'Sun':false,'Bulb':false}
      ),
      Questions(
      id: '6',
      title: 'Which year did World war I start?',
      options:{'1913':false,'1915':false,'1914':true,'1912':false}
      ),
      Questions(
      id: '7',
      title: 'Which year did World war I end?',
      options:{'1917':false,'1918':true,'1916':false,'1919':false}
      ),
      Questions(
      id: '8',
      title: 'Which option is NOT a part of the primary memory of a computer?',
      options:{'PROM':true,'DRAM':false,'SRAM':false,'DRDRAM':false}
      ),
      Questions(
      id: '9',
      title: 'What does CPU stand for?',
      options:{'Central Process Unit':false,'Central Processor Unit':false,'Computer Personal Unit':false,'Central Processing Unit':true}
      ) ,
      Questions(
      id: '10',
      title: ' Who is the father of computer?',
      options:{'Charles Babbage':true,' Douglas Engelbart':false,'Karl Ferdinand Braun':false,'Christopher Latham Sholes':false}
      )
  ];
  int index=0;
  int score=0;
  bool isClicked=false; 
  bool isSelected=false;
  void Nextquestion(){
    if(index== _questions.length -1){
      showDialog(context: context,barrierDismissible: false, builder:(ctx)=>Resultbox(
        score:score ,
        questionslength: _questions.length,
        onClick: StartAgain,
      ));
    }else{
    if(isClicked){
    setState(() {
      index++;
      isClicked=false;
      isSelected=false;
       });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content:  Text('You have to select an option before moving to the next part.Thank you'),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(vertical: 21))
      );
    }
    }
  } 
  void CheckAnswer(bool option){
    if(isSelected){ 
      return;
    }else{ 
      if(option==true){
      score++;
      }
      setState(() {
      isClicked=true; 
      isSelected=true;
    });
    }
    } 
  void StartAgain(){
    setState(() {
      index=0;
      score=0;
      isClicked=false;
      isSelected=false;
    });
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz App'),
        backgroundColor: Colors.cyan,
        shadowColor: Colors.transparent,
      actions: [
        Padding(padding: const EdgeInsets.all(18),
         child: Text('Your score is:$score',
         style: const TextStyle(fontSize: 18),
         ),
        )
      ],

      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
          QuestionsWidget(
            questionindex: index,
            questions: _questions[index].title,
            totalquestions: _questions.length,
           ),
           const Divider(color:Colors.white70),
           const SizedBox(height: 25),
           for(int i=0;i<_questions[index].options.length;i++)
           GestureDetector(
            onTap: () => CheckAnswer(
              _questions[index].options.values.toList()[i]),
             child: Optioncard(
              option: _questions[index].options.keys.toList()[i],
              color:isClicked 
              ? _questions[index].options.values.toList()[i]==true
              ? Colors.lightGreen
              :Colors.red 
              :Colors.white70,
             ),
           ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Nextquestionbtn(Nextquestion: Nextquestion,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}