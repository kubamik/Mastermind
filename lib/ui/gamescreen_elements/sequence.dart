import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mastermind/bloc/game_bloc.dart';
import 'package:mastermind/bloc/game_states.dart';

class Sequence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return BlocBuilder<GameBloc, GameState>(
      builder: (BuildContext context, GameState state) {
        if (state is GameStateGameOver) {
          return Container(
            color: Colors.transparent,
            height: size * 75 / 360,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                for (var color in state.sequence)
                  Expanded(
                    child: Container(
                      width: size * 35 / 360,
                      height: size * 35 / 360,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(color),
                      ),
                    ),
                  ),
              ],
            ),
          );
        }
        return null;
      },
    );
  }
}
