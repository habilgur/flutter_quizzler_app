import 'package:flutter/material.dart';
import 'package:flutter_quizzler_app/score_page.dart';
import 'models/QuestonManager.dart';
import 'models/question.dart';

class QuestionAnswerPage extends StatefulWidget {
  @override
  _QuestionAnswerPageState createState() => _QuestionAnswerPageState();
}

class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  int _playerScore = 0;
  List<Icon> scoreIcon = [];
  int finalScore;
  QuestionManager questManager = QuestionManager();
  List<Question> questList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    questList = questManager.questList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: (MediaQuery.of(context).size.height) / 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: questionBody(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildFlatButton(true, Colors.green),
                ),
              ),
              Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildFlatButton(false, Colors.red),
                ),
              ),
              Container(
                child: Center(
                  child: Text("Current Score: ${_playerScore * 100}",
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: scoreIcon,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget questionBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("${questManager.question()}"),
      ],
    );
  }

  Widget buildFlatButton(bool buttonLabel, Color color) {
    return FlatButton(
      child: Text(
        buttonLabel.toString().toUpperCase(),
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
      color: color,
      onPressed: () {
        setState(() {
          var rightAnswer = questManager.correctAnswer();
          var userAnswer = buttonLabel;
          checkAnswer(rightAnswer, userAnswer);
          questManager.nextQuestion();
          finishGameOrSetNextQuestion();
        });
      },
    );
  }

  checkAnswer(bool rightAnswer, bool userAnswer) {
    if (rightAnswer == userAnswer) {
      _playerScore++;
      scoreIcon.add(
        Icon(Icons.check, color: Colors.green),
      );
    } else {
      _playerScore--;
      scoreIcon.add(
        Icon(Icons.clear, color: Colors.red),
      );
    }
  }

  finishGameOrSetNextQuestion() {
    var fin = questManager.isQuestionListFinished();
    if (fin) {
      finalScore = _playerScore * 100;
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return ScorePage(finalScore);
      }));

      // Reset Question number for new Game...
      resetScore();
    }
  }

  void resetScore() {
    _playerScore = 0;
    scoreIcon = [];
  }
}
