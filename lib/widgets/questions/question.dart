import 'package:flutter/widgets.dart';

abstract class Question {
  final String questionText;

  Question(this.questionText);

  // Abstract method for building the answer input
  Widget buildAnswerInput(Function(dynamic) onSubmit);

  // Abstract method for validating answers
  bool validateAnswer(dynamic answer);
}