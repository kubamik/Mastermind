import 'dart:async' show StreamController;

import 'package:mastermind/ui/ui_contants.dart';
import 'package:mastermind/bloc/game_events.dart';


class MyStreamControllers {
  static List<dynamic> data;
  List<StreamController<dynamic>> controllers = [
    for (int i = 0; i < 5; i++) StreamController<dynamic>()
  ];

  MyStreamControllers() {
    data = [
      int.parse(defaultTrials),
      fieldNumbers[0],
      colorNumbers[0],
      repeatDefault,
      emptyDefault
    ];
  }


  Future<void> register() async{
    for (int i = 0; i < 5; i++) {
      controllers[i].stream.listen((value) async{
        data[i] = value;
        print(data);
        print('$i detected');
      });
    }
  }

  void startGame(Sink sink) async{
    controllers.forEach((element) => element.close());
    print(data);
    sink.add(StartGame(
      data[1],
      data[2],
      data[0],
      data[3],
      data[4],
    ));
  }
}
