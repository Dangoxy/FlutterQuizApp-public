import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    var correctColor = Colors.black;

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              if (data['user_answer'] == data['correct_answer']) {
                correctColor = const Color.fromARGB(255, 0, 221, 114);
              } else {
                correctColor = const Color.fromARGB(255, 255, 46, 46);
              }

              return Row(children: [
                Column(
                  children: [
                    Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          color: Colors.black,
                          backgroundColor: correctColor,
                          ),
                    ),
                    const SizedBox(height: 50,)
                  ],
                ),
                
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'].toString(),
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 175, 175, 175),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: GoogleFonts.lato(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 150, 150, 150)),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: GoogleFonts.lato(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 0, 107, 160)),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
              ]);
            },
          ).toList(),
        ),
      ),
    );
  }
}
