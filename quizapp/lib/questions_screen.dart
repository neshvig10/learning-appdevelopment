import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';
import 'package:quizapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer,{super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex=0;

  void startQuestion(){
    setState(() {
      currentQuestionIndex=0;
    });
  }


  void answerQuestion(String answer1){
    widget.onSelectAnswer(answer1);
    // currentQuestionIndex=currentQuestionIndex+1;
    // currentQuestionIndex+=1;
    setState(() {
      currentQuestionIndex++;      
      if (currentQuestionIndex==questions.length)
      {
        currentQuestionIndex=0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(currentQuestion.question,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),

          ),
          const SizedBox(height: 30,),
          ...currentQuestion.getShuffledAnswers().map(
            (items) => AnswerButton(
              items, () {
                answerQuestion(items); 
              })),        

      ],
      )
    );
  }
}