import 'package:flutter/material.dart';

import 'question.dart';

class NumericQuestion extends Question {
  NumericQuestion(this.questionText, this.correctAnswer);

  @override
  final String questionText;
  final int correctAnswer;

  @override
  bool validateAnswer(dynamic answer) {
    return answer == correctAnswer;
  }

  @override
  Widget buildAnswerInput(Function(dynamic) onAnswerChanged) {
    return TextField(
      keyboardType: TextInputType.number,
      onChanged: (value) => onAnswerChanged(int.tryParse(value)),
      decoration: InputDecoration(labelText: "Enter a number"),
    );
  }
}
