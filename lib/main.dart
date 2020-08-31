import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastermind/bloc/game_states.dart';

import 'package:mastermind/ui/gamescreen.dart';
import 'package:mastermind/ui/startscreen.dart';
import 'package:mastermind/bloc/game_bloc.dart';
import 'package:mastermind/ui/startscreen_elements/stream_controllers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyStreamControllers.start();
    return BlocProvider(
      create: (context) => GameBloc(),
      child: BlocConsumer<GameBloc, GameState>(
        buildWhen: (GameState p, GameState n) => false,
        listenWhen: (GameState prevState, GameState newState) =>
            newState is GameStateGameOver,
        listener: (BuildContext context, GameState state) =>
            MyStreamControllers.reset(),
        builder: (BuildContext context, GameState state) {
          return MaterialApp(
            title: 'Mastermind',
            initialRoute: '/',
            routes: {
              '/': (context) => Startscreen(),
              '/game': (context) => Gamescreen(),
            },
          );
        },
      ),
    );
  }
}
