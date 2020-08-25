import 'dart:async' show StreamController;

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastermind/bloc/game_bloc.dart';
import 'package:mastermind/bloc/game_states.dart';
import 'package:mastermind/ui/ui_contants.dart';
import 'package:mastermind/bloc/game_events.dart';


class MyStreamControllers {
  static List<dynamic> data;
  static MyStreamControllers cls;
  List<StreamController<dynamic>> controllers = [
    for (int i = 0; i < 5; i++) StreamController<dynamic>()
  ];

  MyStreamControllers.produce();

  factory MyStreamControllers() => cls ?? MyStreamControllers.make();

  factory MyStreamControllers.make() {
    cls = new MyStreamControllers.produce();
    data = [
      fieldNumbers[0],
      colorNumbers[0],
      repeatDefault,
      emptyDefault,
      int.parse(defaultTrials),
    ];
    BlocListener<GameBloc, GameState>(
      listener: (BuildContext context,GameState state) {
        if (state is GameStateGameOver) {
          data = [
            fieldNumbers[0],
            colorNumbers[0],
            repeatDefault,
            emptyDefault,
            int.parse(defaultTrials),
          ];
        }
      },
    );
    return cls;
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
      data[0],
      data[1],
      data[4],
      data[2],
      data[3],
    ));
  }
}
