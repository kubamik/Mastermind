import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mastermind/bloc/game_bloc.dart';
import 'package:mastermind/bloc/game_states.dart';

class Heading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return BlocBuilder<GameBloc, GameState>(
      buildWhen: (GameState prevState, GameState state) =>
          prevState.trial != state.trial,
      builder: (BuildContext context, GameState state) {
        return Container(
          height: size * 50 / 360,
          child: Padding(
            padding: EdgeInsets.only(top: size * 20 / 360),
            child: Text(
              '${state.trial} / ${state.trialCount}',
              style: TextStyle(
                  color: Colors.white, fontSize: size * 30 / 360, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
