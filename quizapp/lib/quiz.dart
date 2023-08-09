import 'package:flutter/material.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/start_screen.dart';


class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  var activeScreen='start-screen';

  // dont use var as the keyword here



  void switchScreen(){
    setState(() {
      activeScreen = 'questions-screen';
    });
  }  

  @override
  Widget build(context){

    Widget screenWidget=StartScreen(switchScreen);

    if (activeScreen=='questions-screen')
    {
      screenWidget=const QuestionsScreen();
    }

    return MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 66, 0, 180),
              Color.fromARGB(255, 79, 45, 138),
            ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ),
          ),
        child: screenWidget,
      ),
    ),
  );
    
  }
}