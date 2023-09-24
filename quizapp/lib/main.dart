import 'package:flutter/material.dart';

import 'package:quizapp/start_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          child: const StartScreen(),
        )
      ),
    );
  }
}