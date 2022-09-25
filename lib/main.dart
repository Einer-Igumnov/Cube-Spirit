import 'package:flutter/material.dart';
import 'screens/timer_screen.dart';
import 'functions.dart';

void main() {
  scramble = gen_scramble(20);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Calibri",
        primarySwatch: Colors.blue,
      ),
      home: const TimerPage(title: 'Flutter Demo Home Page'),
    );
  }
}
