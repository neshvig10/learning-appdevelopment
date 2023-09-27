import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerbutton,this.onClick,{super.key});

  final String answerbutton;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 40,
      margin: const EdgeInsets.all(4),
      child: ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: const Color.fromARGB(255, 25, 0, 71),
        foregroundColor: Colors.white,
      ), 
      child: Text(answerbutton),  
      ),
    );
  }
}