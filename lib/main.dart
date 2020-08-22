import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mastermind/ui/gamescreen.dart';
import 'package:mastermind/ui/startscreen.dart';
import 'package:mastermind/bloc/game_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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