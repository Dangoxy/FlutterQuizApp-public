import 'package:flutter/material.dart';
import 'package:advbasics/answer_button.dart';
import 'package:advbasics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectedAnswer,{super.key});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  var currQuestionIndex = 0;

  void answerQuestion(String selectedAnswers){
    widget.onSelectedAnswer(selectedAnswers);
    setState(() {
      currQuestionIndex++;
    });

  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 195, 149, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
                
              ),textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffled().map((answer){
              return AnswerButton(answer, (){
                answerQuestion(answer);
              });
            },)
      
          ],
        ),
      ),
    );
  }
}
