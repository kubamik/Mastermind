import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mastermind/bloc/game_bloc.dart';
import 'package:mastermind/bloc/game_events.dart';
import 'package:mastermind/bloc/game_states.dart';

class ColorButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return BlocBuilder<GameBloc, GameState>(
      builder: (BuildContext context, GameState state) {
        if (state is GameStateOneActive) {
          return Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  height: size * 75 / 360,
                  width: size * 300 /360,
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    padding: EdgeInsets.all(2.5),
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      for (var color in state.colors)
                        Container(
                          child: RaisedButton(
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            color: Color(color),
                            onPressed: () {
                              BlocProvider.of<GameBloc>(context).add(ColorChanged(color: color));
                            },
                            shape: CircleBorder(),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              RaisedButton(
                onPressed: state.pushable
                    ? () {
                  BlocProvider.of<GameBloc>(context).add(AnswerAdded());
                      }
                    : null,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                shape: CircleBorder(),
                color: Colors.white,
                disabledTextColor: Colors.transparent,
                disabledColor: Colors.transparent,
                focusColor: Colors.transparent,
                child: SizedBox(
                  child: Icon(Icons.check, size: size * 40 / 360),
                  width: size * 50 / 360,
                  height: size * 50 / 360,
                ),
              ),
            ],
          );
        }
        return null;
      },
    );
  }
}
