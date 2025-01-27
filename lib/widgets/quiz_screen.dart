import 'dart:async';
import 'package:flutter/material.dart';

import 'question_feedback.dart';
import 'questions/choice_question.dart';
import 'questions/numeric_question.dart';
import 'questions/question.dart';
import 'quiz_top_bar.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  QuizScreenState createState() => QuizScreenState();
}

// NOTE: Normally I would use a view model here but due to time constraint
// I choose for the most simple approach.
class QuizScreenState extends State<QuizScreen> {
  // NOTE: Normally these would get loaded by an API call.
  final List<Question> questions = [
    NumericQuestion("What is 5 + 3 ?", 8),
    NumericQuestion("What is 12 x 2 ?", 24),
    NumericQuestion("What is 7 - 4 ?", 3),
    ChoiceQuestion("Pick the largest planet",
        ["Jupiter", "Mars", "Earth", "Saturn"], "Jupiter"),
    ChoiceQuestion("Who is the best applicant?",
        ["Joel", "Mike", "Ruben", "Dwayne"], "Ruben"),
    ChoiceQuestion("Complete the idiom: Break a ...",
        ["Chair", "Teeth", "Neck", "Leg"], "Leg"),
  ];

  int currentQuestionIndex = 0;
  String? feedbackMessage;
  bool showFeedback = false;
  int userScore = 0;
  double progressBarValue = 1.0;

  void handleAnswer(dynamic answer) {
    final currentQuestion = questions[currentQuestionIndex];
    final isCorrect = currentQuestion.validateAnswer(answer);

    setState(() {
      feedbackMessage = isCorrect ? "Correct!" : "Wrong!";
      showFeedback = true;
      if (isCorrect) {
        userScore += 100;
      }

      // NOTE: Normally there would be an API call here to POST the result.
    });

    // Start a timer to simulate progress bar shrinking
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        progressBarValue -= 0.01;
      });

      if (progressBarValue <= 0) {
        timer.cancel();
        setState(() {
          showFeedback = false;
          progressBarValue = 1.0; // Reset progress bar for next question
          currentQuestionIndex++;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // If quiz is complete, only display the completion message
    if (currentQuestionIndex >= questions.length) {
      return Scaffold(
        appBar: QuizTopBar(
          userScore: userScore,
          firstNameInitial: "R",
        ),
        body: Center(
          child: Text(
            "Quiz Complete!",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    // If not complete, show the current question
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: QuizTopBar(
        userScore: userScore,
        firstNameInitial: "R",
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            if (showFeedback) ...[
              LinearProgressIndicator(
                value: progressBarValue,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                minHeight: 5,
              ),
            ],
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: showFeedback
                      ? QuestionFeedback(feedbackMessage: feedbackMessage)
                      : Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            currentQuestion.questionText,
                            style: TextStyle(
                              fontSize: 30, // Larger font size
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                ),
              ),
            ),
            if (!showFeedback) ...[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: currentQuestion.buildAnswerInput(handleAnswer),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
