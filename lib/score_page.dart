import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_quizzler_app/qa_page.dart';

class ScorePage extends StatelessWidget {
  final int playerScore;

  ScorePage(this.playerScore);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Your Score: $playerScore", style: TextStyle(fontSize: 42)),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                color: Colors.orange,
                child: Text(
                  "Play Again",
                  style: TextStyle(fontSize: 22),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
