import 'main.dart';
import 'dart:math';

DateTime start_time = DateTime.now();
DateTime end_time = DateTime.now();

int duration = 0;

bool is_running = false;

List<Map<DateTime, int>> solves = [];
int solve_sum = 0;

String scramble = "";

void start_timer() {
  start_time = DateTime.now();
}

void stop_timer() {
  end_time = DateTime.now();
  duration = count_duration(start_time, end_time);
  solves.add({DateTime.now(): duration});
  solve_sum += duration;
  print(duration);
}

int count_duration(DateTime a, DateTime b) {
  int ans = 0;
  ans = b.difference(a).inMilliseconds;
  return ans;
}

String gen_scramble(int length) {
  List<String> letters = ["U", "D", "L", "F", "R", "B"];
  List<String> special = ["'", "2", ""];

  String restricted = "";

  String ret = "";

  var rnd = Random();

  for (int i = 0; i < length; i++) {
    if (restricted != "") {
      letters.remove(restricted);
    }
    String new_restricted = letters[rnd.nextInt(letters.length)];
    ret += new_restricted;
    if (restricted != "") {
      letters.add(restricted);
    }
    restricted = new_restricted;
    ret += special[rnd.nextInt(3)];
    ret += "  ";
  }

  return ret;
}

String format_time(int a) {
  String ret = "";
  if (a ~/ 60000 < 10) {
    ret += "0";
  }
  ret += "${a ~/ 60000}:";
  if ((a ~/ 1000) % 60 < 10) {
    ret += "0";
  }
  ret += "${(a ~/ 1000) % 60}:";
  if (a % 1000 ~/ 10 < 10) {
    ret += "0";
  }
  ret += "${a % 1000 ~/ 10}";
  return ret;
}
