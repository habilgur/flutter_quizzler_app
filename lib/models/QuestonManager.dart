import 'package:flutter_quizzler_app/models/question.dart';

class QuestionManager {
  int _questionIndex = 0;
  List<Question> _quesList = [
    Question("Soru1", true),
    Question("Soru2", false),
    Question("Soru3", true),
    Question("Soru4", false),
    Question("Soru5", false),
    Question("Soru6", true),
    Question("Soru7", true),
    Question("Soru8", false),
    Question("Soru9", false),
  ];

  void nextQuestion() {
    if (_questionIndex < _quesList.length - 1)
      _questionIndex++;
    else
      _questionIndex = 0;
  }

  bool isQuestionListFinished() {
    if (_questionIndex == 0) return true;
    return false;
  }

  List<Question> questList() => _quesList;
  String question() => _quesList[_questionIndex].question;
  bool correctAnswer() => _quesList[_questionIndex].answer;
}
