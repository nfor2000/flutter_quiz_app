import 'package:flutter/material.dart';
import 'package:mb_quiz/pages/home_page.dart';
import 'package:mb_quiz/pages/questions_page.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
         '/questionpage':(context) =>const  QuestionPage(),
         '/homepage':(context) =>const  HomePage(),
      },
      home: const HomePage(),
    );
  }
}
