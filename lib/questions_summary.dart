import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              final isAnswerCorrect =
                  data['user_answer'] == data['correct_answer'];
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isAnswerCorrect
                            ? Colors.blue[200]
                            : Colors.pink[300]),
                    alignment: Alignment.center,
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.white),
                              data['question'] as String),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            textAlign: TextAlign.left,
                            data['user_answer'] as String,
                            style: TextStyle(
                                color:
                                    const Color.fromARGB(255, 180, 143, 243)),
                          ),
                          Text(
                            textAlign: TextAlign.left,
                            data['correct_answer'] as String,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 78, 173, 250)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
