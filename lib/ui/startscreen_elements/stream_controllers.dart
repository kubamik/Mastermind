import 'dart:async' show StreamController;

import 'package:mastermind/ui/ui_contants.dart';
import 'package:mastermind/bloc/game_events.dart';

class MyStreamControllers {
  static List<dynamic> data = [
    fieldNumbers[0],
    colorNumbers[0],
    repeatDefault,
    emptyDefault,
    int.parse(defaultTrials),
  ];
  static MyStreamControllers cls;
  static List<StreamController<dynamic>> controllers = [
    for (int i = 0; i < 5; i++) StreamController<dynamic>()
  ];
  static bool started = false;


  static Future<void> start() async {
    if (started) return;
    started = true;
    for (int i = 0; i < 5; i++) {
      controllers[i].stream.listen((value) async {
        data[i] = value;
      });
    }
  }

  static reset() {
    data = [
      fieldNumbers[0],
      colorNumbers[0],
      repeatDefault,
      emptyDefault,
      int.parse(defaultTrials),
    ];
    controllers = [for (int i = 0; i < 5; i++) StreamController<dynamic>()];
    for (int i = 0; i < 5; i++) {
      controllers[i].stream.listen((value) async {
        data[i] = value;
      });
    }
  }

  static void startGame(Sink sink) async {
    controllers.forEach((element) => element.close());
    print(data);
    sink.add(StartGame(
      data[0],
      data[1],
      data[4],
      data[2],
      data[3],
    ));
  }
}
