import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromRGBO(44, 62, 80, 1),
        ),
        Positioned.fill(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Image.asset(
                  "assets/image/src_assets_image_logo.png",
                  width: 300,
                ),
              ),
              Container(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueAccent),
                        child: Center(
                          child: Image.asset(
                              "assets/image/src_assets_image_play.png",
                              height: 50),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            width: width / 3 - 10,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueAccent),
                            child: Center(
                              child: Image.asset(
                                  "assets/image/src_assets_image_achievement.png",
                                  height: 40),
                            ),
                          ),
                          Container(
                            width: width / 3 - 10,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueAccent),
                            child: Center(
                              child: Image.asset(
                                  "assets/image/src_assets_image_leaderboard.png",
                                  height: 40),
                            ),
                          ),
                          Container(
                            width: width / 3 - 10,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueAccent),
                            child: Center(
                              child: Image.asset(
                                  "assets/image/src_assets_image_true.png",
                                  height: 40),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ))
      ],
    ));
  }
}
