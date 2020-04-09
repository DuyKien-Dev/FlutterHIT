import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/Splash.dart';
import 'package:flutter_app/score.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int so1 = 0;
  int so2 = 0;
  int kq = 0;
  int score = 0;
  double percent = 1;
  var rng = new Random();
  bool isEnd = false;
  List saiSo = [0, 1, -1, 0, 0, -2, -4];
  Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    randomNumber();

    super.initState();

    timer = Timer.periodic(new Duration(milliseconds: 1000), (timer) {
      if (percent == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Score(
              score: score,
            ),
          ),
        );
        timer.cancel();
      }
      else{
          setState(() {
        percent = percent - 0.1;
      });
      }
    });
  }

  randomNumber() {
    setState(() {
      so1 = rng.nextInt(10);
      so2 = rng.nextInt(10);
      kq = so1 + so2 + saiSo[rng.nextInt(saiSo.length)];
    });
  }

  check(isCheck) {
    if (isCheck) {
      if (so1 + so2 == kq) {
        score++;
        randomNumber();
      } else {
        //Chuyen man hinh
        // setState(() {
        //   isEnd = true;
        // });
        // print("Chuyen man hinh");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Score(
              score: score,
            ),
          ),
        );
      }
    } else {
      if (!(so1 + so2 == kq)) {
        score++;
        randomNumber();
      } else {
        //Chuyen man hinh
        // setState(() {
        //   isEnd = true;
        // });
        // print("Chuyen man hinh");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Score(
              score: score,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromRGBO(215, 97, 50, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                    child: LinearPercentIndicator(
                      width: width,
                      lineHeight: 14.0,
                      percent: percent > 0 ? percent : 0 ,
                      backgroundColor: Colors.transparent,
                      progressColor: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/image/src_assets_image_soundon.png",
                          width: 40,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          score.toString(),
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "$so1+$so2",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 80),
                  ),
                  Text(
                    "=$kq",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 80),
                  ),
                  // isEnd == true ? Image.asset("assets/image/src_assets_image_false.png") : Container()
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        check(true);
                      },
                      child: Container(
                        width: width / 2 - 10,
                        height: width / 2 - 10,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Image.asset(
                              "assets/image/src_assets_image_true.png",
                              color: Colors.blueAccent,
                              width: width / 3),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        check(false);
                      },
                      child: Container(
                        width: width / 2 - 10,
                        height: width / 2 - 10,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Image.asset(
                            "assets/image/src_assets_image_false.png",
                            color: Colors.redAccent,
                            width: width / 3,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
