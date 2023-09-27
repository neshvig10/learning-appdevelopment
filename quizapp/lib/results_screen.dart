import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.restartQuiz,this.chosenAnswers,{super.key});

  final void Function() restartQuiz;

  final List<String> chosenAnswers;

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary = [];
    for (var i=0;i<chosenAnswers.length;i++){
      summary.add(
        {
          'question_index':i,
          'question':questions[i].question,
          'correct_answer':questions[i].options[0],
          'chosen_answer':chosenAnswers[i]
        }
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((element) => 
      (element['correct_answer']==element['chosen_answer'])
      ).length;


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly !',
            style: const TextStyle(color: Colors.white),),
            const SizedBox(height: 30,),
            QuestionsSummary(getSummaryData()),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: restartQuiz, child: const Text('Restart Quiz')),


          ],         
        )
      ),
    );
  }
}