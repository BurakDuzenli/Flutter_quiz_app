import 'package:flutter/material.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});
  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              label: Text(
                'Restart Quiz!',
                style: TextStyle(color: Colors.white),
              ),
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
