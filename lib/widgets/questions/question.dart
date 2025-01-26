import 'package:flutter/widgets.dart';

abstract class Question {
  late String questionText;
  bool validateAnswer(dynamic answer);
  Widget buildAnswerInput(Function(dynamic) onAnswerChanged);
}