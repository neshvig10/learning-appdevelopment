import 'package:flutter/material.dart';
import 'package:quizapp/start_screen.dart';

void main(){
  runApp(
    MaterialApp(
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
        child: const StartScreen(),
      ),
    ),
  ));
}