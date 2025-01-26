import 'package:flutter/material.dart';

import 'question.dart';

class ChoiceQuestion extends Question {
  ChoiceQuestion(this.questionText, this.choices, this.correctAnswer);

  @override
  final String questionText;
  final List<String> choices;
  final String correctAnswer;

  @override
  bool validateAnswer(dynamic answer) {
    return answer == correctAnswer;
  }

  @override
  Widget buildAnswerInput(Function(dynamic) onAnswerChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...choices.map(
              (choice) => RadioListTile(
            title: Text(choice),
            value: choice,
            groupValue: correctAnswer,
            onChanged: (value) => onAnswerChanged(value),
          ),
        ),
      ],
    );
  }
}