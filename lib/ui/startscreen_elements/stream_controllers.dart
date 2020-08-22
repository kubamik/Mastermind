import 'dart:async' show StreamController;

import 'package:mastermind/ui/ui_contants.dart';

class MyStreamControllers {
  List<dynamic> data = [
    int.parse(defaultTrials),
    fieldNumbers[0],
    colorNumbers[0],
    repeatDefault,
    emptyDefault
  ];
  List<StreamController<dynamic>> controllers = [
    for (int i = 0; i < 5; i++) StreamController<dynamic>()
  ];

  MyStreamControllers() {
    for (int i = 0; i < 5; i++) {
      controllers[i].stream.listen((value) => data[i] = value);
    }
  }
}
