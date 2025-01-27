import 'package:flutter/material.dart';

import 'quiz_screen.dart';


class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gynzy',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: QuizScreen(),
    );
  }
}