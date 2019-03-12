import 'package:flutter/material.dart';
import './first_page.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int totalQuestions;
  ScorePage(this.score, this.totalQuestions);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your score: ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 50.0,
            ),
          ),
          Text(
            score.toString() + '/' + totalQuestions.toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 50.0,
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => FirstPage()),
                  (Route route) => route == null,
                ),
          ),
        ],
      ),
    );
  }
}
