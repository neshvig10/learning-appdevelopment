import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
      // this line is used to center align the image
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
        width: 300,
        color: const Color.fromARGB(144, 211, 173, 255),
        ),
        // Opacity(
        //   opacity: 0.3,
        //   child: Image.asset(
        //   'assets/images/quiz-logo.png',
        // width: 300,
        // ),
        // ),
        const SizedBox(height: 50,),
        Text('Learn Flutter in the fun way',
        // how to add style to a text inside the text widget
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 50,),
        OutlinedButton(
          onPressed: () {
            startQuiz();
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          child: const Text('Start Quiz')),
      ],
    ));
  }
}