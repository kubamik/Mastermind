import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mastermind/bloc/game_bloc.dart';
import 'package:mastermind/bloc/game_states.dart';

import 'package:mastermind/ui/gamescreen_elements/heading.dart';
import 'package:mastermind/ui/gamescreen_elements/sequence.dart';
import 'package:mastermind/ui/gamescreen_elements/trials_list.dart';
import 'package:mastermind/ui/gamescreen_elements/color_buttons.dart';
import 'package:mastermind/ui/gamescreen_elements/field.dart';

class Gamescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return BlocListener<GameBloc, GameState>(
      listener: (BuildContext context, GameState state) {
        if (state is GameStateGameOver) {
          _showEndingMessage(context, state);
        }
      },
      child: BlocBuilder<GameBloc, GameState>(
        buildWhen: (GameState prevState, GameState state) =>
            prevState.runtimeType != state.runtimeType,
        builder: (BuildContext context, GameState state) {
          return Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: <Widget>[
                  Heading(),
                  if (state is GameStateGameOver) Sequence(),
                  TrialsList(),
                  if (state is GameStateOneActive)
                    Divider(thickness: 5, color: Colors.white),
                  if (state is GameStateOneActive) ColorButtons(),
                  if (state is! GameStateGameOver)
                    Divider(thickness: 5, color: Colors.white),
                  if (state is! GameStateGameOver) Field(),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
            floatingActionButton: state is GameStateGameOver
                ? FloatingActionButton(
                    child: Icon(Icons.sync, color: Colors.black),
                    backgroundColor: Colors.white,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onPressed: () =>
                        Navigator.of(context).pushReplacementNamed('/'),
                  )
                : null,
          );
        },
      ),
    );
  }

  Future<Function> _showEndingMessage(
      BuildContext context, GameStateGameOver state) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(state.message),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 15 / 360,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
