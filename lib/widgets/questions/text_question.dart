import 'package:flutter/material.dart';

import 'question.dart';

class TextQuestion extends Question {
  TextQuestion(this.questionText, this.correctAnswer);

  @override
  final String questionText;
  final String correctAnswer;

  @override
  bool validateAnswer(dynamic answer) {
    return answer.toString().toLowerCase() == correctAnswer.toLowerCase();
  }

  @override
  Widget buildAnswerInput(Function(dynamic) onAnswerChanged) {
    return TextField(
      onChanged: (value) => onAnswerChanged(value),
      decoration: InputDecoration(labelText: "Type your answer"),
    );
  }
}
