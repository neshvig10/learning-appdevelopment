import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';



class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  
  void func(){}

  @override
  Widget build(context){
    return 
    SizedBox(
      width: double.infinity,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('The question is ... ',style: TextStyle(
            color: Colors.white,
          ),),
          const SizedBox(height: 30,),
          AnswerButton('Option 1',(){}),
          const SizedBox(height: 10,),
          AnswerButton('Option 2',(){}),
          const SizedBox(height: 10,),
          AnswerButton('Option 3',(){}),
          const SizedBox(height: 10,),
          AnswerButton('Option 4',(){}),
      ],
    )   
    );
  }
}
