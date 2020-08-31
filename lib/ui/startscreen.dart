import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mastermind/bloc/game_bloc.dart';

import 'package:mastermind/ui/startscreen_elements/checkbar.dart';
import 'package:mastermind/ui/startscreen_elements/choosebar.dart';
import 'package:mastermind/ui/startscreen_elements/stream_controllers.dart';
import 'package:mastermind/ui/startscreen_elements/textinputfield.dart';
import 'package:mastermind/ui/ui_contants.dart';

class Startscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      appBar: AppBar(
        title: Text('Mastermind'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {
              showDialog(
                  context: context,
                  child: SimpleDialog(
                    title: Text(helpTitle),
                    children: [
                      for (var text in helpText)
                        SimpleDialogOption(
                            child: Text(
                          text,
                          style: TextStyle(fontSize: size * 17 / 360),
                        ))
                    ],
                  ));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextInputField(trialTitle, MyStreamControllers.controllers[4]),
            ChooseBar(fieldTitle, fieldNumbers, MyStreamControllers.controllers[0]),
            ChooseBar(colorsTitle, colorNumbers, MyStreamControllers.controllers[1]),
            CheckBar(repeatTitle, repeatDefault, MyStreamControllers.controllers[2]),
            CheckBar(emptyTitle, emptyDefault, MyStreamControllers.controllers[3]),
            RaisedButton(
              child: Text(
                'START',
                style: TextStyle(fontSize: size * 15 / 360),
              ),
              onPressed: () {
                MyStreamControllers.startGame(BlocProvider.of<GameBloc>(context));
                Navigator.of(context).pushReplacementNamed('/game');
              },
            ),
          ],
        ),
      ),
    );
  }
}
