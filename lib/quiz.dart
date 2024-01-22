import 'package:advbasics/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:advbasics/start_page.dart';
import 'package:advbasics/data/questions.dart';
import 'package:advbasics/results_screen.dart';
class Quiz extends StatefulWidget{
  const Quiz({super.key});
  
  @override
  State<Quiz> createState(){
    return _QuitState();
  }
}

class _QuitState extends State<Quiz> {

  List<String> selectedAnswers = [];

  var activeScreen = 'start-page';

  void switchScreen(){
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context){
    Widget screenWidget = StartPage(switchScreen);

    if (activeScreen == 'questions-screen'){
      screenWidget = QuestionsScreen(chooseAnswer);
    }

    if (activeScreen == 'results-screen'){
      screenWidget = ResultsScreen(selectedAnswers,restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 119, 0, 255),
              Color.fromARGB(255, 76, 0, 255),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }

}