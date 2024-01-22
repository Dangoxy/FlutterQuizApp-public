import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.thefunction, {super.key});
  final String answerText;
  final void Function() thefunction;

  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: thefunction,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 48, 39, 176),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40)
        ),
        child: Text(answerText,textAlign: TextAlign.center),);
  }
}
