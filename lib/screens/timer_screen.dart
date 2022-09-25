import 'dart:io';

import 'package:flutter/material.dart';
import '../functions.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.black,
        leadingWidth: 100,
        leading: Image.network(
          "assets/assets/images/logo.png",
          height: 100,
          fit: BoxFit.fitHeight,
        ),
        title: Text(
          "Cube Spirit",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
              left: 25,
              top: MediaQuery.of(context).size.height / 4 - 50 - 100,
              child: InkWell(
                  onTap: () {
                    if (is_running == false) {
                      start_timer();
                      setState(() {
                        is_running = true;
                      });
                    } else {
                      stop_timer();
                      setState(() {
                        scramble = gen_scramble(20);
                        is_running = false;
                      });
                    }
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 200,
                    child: Text(
                      is_running == true ? "" : scramble,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ))),
          Positioned(
              left: 0,
              top: MediaQuery.of(context).size.height / 2 - 50 - 50,
              child: InkWell(
                  onTap: () {
                    if (is_running == false) {
                      start_timer();
                      setState(() {
                        is_running = true;
                      });
                    } else {
                      stop_timer();
                      setState(() {
                        scramble = gen_scramble(20);
                        is_running = false;
                      });
                    }
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Text(
                      is_running ? "Solving..." : format_time(duration),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                  )))
        ],
      ),
    );
  }
}
