import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{

  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(context){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png',width: 300,color: Color.fromARGB(150, 255, 244, 244),),
        
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset('assets/images/quiz-logo.png',width: 300,),
          // ),
          const SizedBox(height: 80,),
          const Text('Learn Flutter the fun way !',style: TextStyle(
            color: Color.fromARGB(255, 224, 208, 255),
            fontSize: 24,
          ),),
          const SizedBox(height: 30,),
          OutlinedButton.icon(
            onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(width: 1.0,color: Colors.white),
            foregroundColor: Colors.white,
          ),
          icon:const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz'))
        ],
      ),
   );
  }
}