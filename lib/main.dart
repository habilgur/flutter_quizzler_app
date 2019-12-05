import 'package:flutter/material.dart';
import 'package:flutter_quizzler_app/qa_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/question": (context) => QuestionAnswerPage(),
      },
      theme: ThemeData(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.white),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Welcome to Quizzler",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: QuestionAnswerPage(),
      ),
    );
  }
}
