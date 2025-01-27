import 'package:flutter/material.dart';
import 'question.dart';

class ChoiceQuestion extends Question {
  final List<String> choices;
  final String correctAnswer;

  ChoiceQuestion(super.questionText, this.choices, this.correctAnswer);

  final List<Color> buttonColors = [
    Colors.blueAccent,
    Colors.purple,
    Colors.redAccent,
    Colors.orangeAccent,
  ];

  @override
  Widget buildAnswerInput(Function(dynamic) onSubmit) {
    final buttonTextStyleText = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

    final gridInsets = EdgeInsets.all(12);

    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: gridInsets,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => onSubmit(choices[0]),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColors[0],
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        choices[0],
                        style: buttonTextStyleText,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: gridInsets,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => onSubmit(choices[1]),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColors[1],
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        choices[1],
                        style: buttonTextStyleText,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: gridInsets,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => onSubmit(choices[2]),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColors[2],
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        choices[2],
                        style: buttonTextStyleText,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: gridInsets,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => onSubmit(choices[3]),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColors[3],
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        choices[3],
                        style: buttonTextStyleText,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool validateAnswer(dynamic answer) {
    return answer == correctAnswer;
  }
}
