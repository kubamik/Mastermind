import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastermind/bloc/game_bloc.dart';

import 'package:mastermind/bloc/game_states.dart';

class TrialsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return BlocBuilder<GameBloc, GameState>(
      buildWhen: (GameState prevState, GameState state) =>
          prevState.trial != state.trial,
      builder: (BuildContext context, GameState state) {
        return Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: <Widget>[
              for (var i = state.submits.length - 1; i >= 0; i--)
                _tile(state.submits[i], i, size),
            ],
          ),
        );
      },
    );
  }

  Widget _tile(List<List<int>> dots, int index, double size) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 5),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: Text(
              '${index + 1}.'.padLeft(3),
              style: TextStyle(
                color: Colors.white,
                fontSize: size * 20 / 360,
                fontWeight: FontWeight.bold,
              ),
            ),
            width: 30,
          ),
          for (var color in dots[0])
            Container(
              width: size * 30 / 360,
              height: size * 30/ 360,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(color),
              ),
            ),
          for (var color in dots[1])
            Container(
              width: size * 10 / 360,
              height: size * 10 / 360,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(color),
              ),
            ),
        ],
      ),
    );
  }
}
