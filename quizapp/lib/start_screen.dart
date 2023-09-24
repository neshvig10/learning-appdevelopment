import 'package:flutter/material.dart';


class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

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
        ),
        const SizedBox(height: 50,),
        const Text('Learn Flutter in the fun way',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 50,),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          child: const Text('Click here')),
      ],
    ));
  }
}