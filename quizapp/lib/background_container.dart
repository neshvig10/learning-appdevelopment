import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget{

  const BackgroundContainer({super.key});

  @override
  Widget build(context){
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 119, 0, 255),
      ),
      child: Center(
        child : Image.asset('assets/images/quiz-logo.png'),
      ),
    );
  }
}