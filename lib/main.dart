import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    MyStreamControllers.make();
    return BlocProvider(
      create: (context) => GameBloc(),
      child: MaterialApp(
        title: 'Mastermind',
        initialRoute: '/',
        routes: {
          '/': (context) => Startscreen(),
          '/game': (context) => Gamescreen(),
        },
      ),
    );
  }
}