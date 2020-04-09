import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  int score = 0;
  Score({this.score});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
          child: Center(child: Text(score.toString()),),
    ),);
  }
}