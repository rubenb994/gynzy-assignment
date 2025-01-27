import 'package:flutter/material.dart';
import 'question.dart';

class NumericQuestion extends Question {
  final int correctAnswer;

  NumericQuestion(super.questionText, this.correctAnswer);

  // Implementing the abstract method from the Question class
  @override
  Widget buildAnswerInput(Function(dynamic) onSubmit) {
    return _NumericQuestionInput(onSubmit: onSubmit);
  }

  // Implementing the validateAnswer method from the Question class
  @override
  bool validateAnswer(dynamic answer) {
    return answer == correctAnswer;
  }
}

class _NumericQuestionInput extends StatefulWidget {
  final Function(dynamic) onSubmit;

  const _NumericQuestionInput({required this.onSubmit});

  @override
  __NumericQuestionInputState createState() => __NumericQuestionInputState();
}

class __NumericQuestionInputState extends State<_NumericQuestionInput> {
  String inputValue = ""; // Holds the current input value

  // Method to handle number input
  void handleInput(String number) {
    if (inputValue.length < 3) {
      setState(() {
        inputValue += number;
      });
    }
  }

  // Method to handle backspace (deleting a character)
  void deleteCharacter() {
    if (inputValue.isNotEmpty) {
      setState(() {
        inputValue = inputValue.substring(0, inputValue.length - 1);
      });
    }
  }

  // Method to submit the answer
  void submitAnswer() {
    final parsedValue = int.tryParse(inputValue);
    if (parsedValue != null) {
      widget.onSubmit(parsedValue); // Submit the answer
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 24, color: Colors.black);

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            inputValue.isEmpty ? "Enter a number" : inputValue,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20),

        // Number buttons (0 to 9)
        Column(
          children: [
            // First row of numbers (1 to 5)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1; i <= 5; i++)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      onPressed: () => handleInput(i.toString()), // Handle number input
                      child: Text(
                        i.toString(),
                        style: textStyle,
                      ),
                    ),
                  ),
                ElevatedButton(
                  onPressed: deleteCharacter,
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(16),
                  ),
                  child: Icon(Icons.backspace),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Second row of numbers (6 to 9) + 0
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 6; i <= 9; i++)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      onPressed: () => handleInput(i.toString()), // Handle number input
                      child: Text(
                        i.toString(),
                        style: textStyle,
                      ),
                    ),
                  ),
                // Add 0 button on the right side
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ElevatedButton(
                    onPressed: () => handleInput('0'), // Handle number 0 input
                    child: Text(
                      '0',
                      style: textStyle,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: submitAnswer,
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(16),
                  ),
                  child: Icon(Icons.check),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
