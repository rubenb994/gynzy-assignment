import 'dart:async';

import 'package:flutter/material.dart';

import 'widgets/questions/choice_question.dart';
import 'widgets/questions/numeric_question.dart';
import 'widgets/questions/question.dart';
import 'widgets/questions/text_question.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // List of questions
  final List<Question> questions = [
    NumericQuestion("What is 5 + 3?", 8),
    TextQuestion("What is the capital of France?", "Paris"),
    ChoiceQuestion("Pick the largest planet", ["Earth", "Mars", "Jupiter"], "Jupiter"),
  ];

  int currentQuestionIndex = 0;
  String? feedbackMessage;
  bool showFeedback = false;

  // Handle answer submission
  void handleAnswer(dynamic answer) {
    final currentQuestion = questions[currentQuestionIndex];
    final isCorrect = currentQuestion.validateAnswer(answer);

    setState(() {
      feedbackMessage = isCorrect ? "Correct!" : "Wrong!";
      showFeedback = true;
    });

    // Move to the next question after 5 seconds
    Timer(Duration(seconds: 5), () {
      setState(() {
        currentQuestionIndex++;
        showFeedback = false;
        if (currentQuestionIndex >= questions.length) {
          // Quiz is finished
          feedbackMessage = "Quiz Complete!";
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= questions.length) {
      // Quiz complete screen
      return Scaffold(
        appBar: AppBar(title: Text("Quiz Complete")),
        body: Center(
          child: Text(feedbackMessage ?? "You finished the quiz!"),
        ),
      );
    }

    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(title: Text("Quiz App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentQuestion.questionText,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            currentQuestion.buildAnswerInput(handleAnswer),
            SizedBox(height: 24),
            if (showFeedback)
              Center(
                child: Text(
                  feedbackMessage ?? "",
                  style: TextStyle(
                    color: feedbackMessage == "Correct!" ? Colors.green : Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}