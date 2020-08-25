import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastermind/bloc/game_bloc.dart';
import 'package:mastermind/bloc/game_events.dart';

import 'package:mastermind/bloc/game_states.dart';
import 'package:mastermind/ui/ui_contants.dart';

class Field extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return BlocBuilder<GameBloc, GameState>(
      builder: (BuildContext context, GameState state) {
        if (state is GameStateNoneActive || state is GameStateOneActive) {
          return WillPopScope(
            child: Container(
              color: Colors.transparent,
              height: 75,
              child: GestureDetector(
                onHorizontalDragStart: (details) {
                  _showNewGame(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    for (var index = 0;
                        index < state.fieldsColors.length;
                        index++)
                      Expanded(
                        child: FlatButton(
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          color: Color(state.fieldsColors[index]),
                          onPressed: () {
                            BlocProvider.of<GameBloc>(context)
                                .add(ActivityChanged(index));
                          },
                          onLongPress: () {
                            BlocProvider.of<GameBloc>(context)
                                .add(ColorChanged(fieldNumber: index));
                          },
                          child: SizedBox(
                              width: state.activeField == index
                                  ? size * 50 / 360
                                  : size * 20 / 360,
                              height: state.activeField == index
                                  ? size * 50 / 360
                                  : size * 20 / 360),
                          shape: CircleBorder(),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            onWillPop: () => _showNewGame(context),
          );
        }
        return null;
      },
    );
  }

  Future<bool> _showNewGame(BuildContext context) {
    return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(newGameTitle),
              content: Text(newGameQuestion),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    accept,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    BlocProvider.of<GameBloc>(context).add(GameOver());
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text(
                    decline,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        ) ??
        false;
  }
}
