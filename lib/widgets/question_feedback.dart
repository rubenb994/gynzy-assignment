import 'package:flutter/material.dart';

class QuestionFeedback extends StatelessWidget {
  final String? feedbackMessage;

  const QuestionFeedback({super.key, required this.feedbackMessage});

  @override
  Widget build(BuildContext context) {
    bool isCorrect = feedbackMessage == "Correct!";

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          isCorrect ? Icons.check_circle : Icons.cancel,
          color: isCorrect ? Colors.green : Colors.red,
          size: 120,
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            feedbackMessage ?? "",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isCorrect ? Colors.green : Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}