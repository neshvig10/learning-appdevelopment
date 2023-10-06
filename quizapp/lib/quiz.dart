import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/results_screen.dart';
import 'package:quizapp/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  // final variable since we will not reassign this variable but only edit it !
  List<String> selectedAnswers = [];


  void restartQuiz(){
    setState(() {
      selectedAnswers=[];
        activeScreen=StartScreen(switchScreen);
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length){
      setState(() {
        activeScreen=ResultsScreen(restartQuiz,selectedAnswers);
      });
    }
  }


  // we add a question mark to say that the value can also be null
  //  ? is added to the variables which are declared and not initialised with any value
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen(){  
    setState(() {
      activeScreen = QuestionsScreen(chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 92, 37, 187),
              Color.fromARGB(255, 54, 13, 126),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            ),
          ),
          child: activeScreen,
        )
      ),
    );        
  }
}