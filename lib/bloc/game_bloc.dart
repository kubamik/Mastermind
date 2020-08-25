import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mastermind/bloc/game_events.dart';
import 'package:mastermind/bloc/game_states.dart';
import 'package:mastermind/game/game_engine.dart';

class GameBloc extends Bloc<GameEvent, GameState> {

  GameBloc(): super(GameStateNoneActive(const <dynamic>[], 0, const <List<List<int>>>[], const <int>[]));

  @override
  void onTransition(Transition<GameEvent, GameState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<GameState> mapEventToState(GameEvent event) async*{
    if (event is StartGame){
      game = new Game(event.fieldCount, event.colorCount, event.trialCount, event.allowRepeat, event.allowEmpty);
      yield GameStateNoneActive(game.gameData, game.trial, game.submits, game.fieldsColors);
    }
    if (event is GameOver) {
      game.surrender();
      yield GameStateGameOver(game.gameData, game.trial, game.submits, game.sequence, game.gameEnd);
    }
    if (event is AnswerAdded) {
      yield* _mapAnswerAddedToState(event);
    }
    if (event is ColorChanged) {
      yield* _mapColorChangedToState(event);
    }
    if (event is ActivityChanged) {
      yield* _mapActivityChangedToState(event);
    }
    if (event is AnswerCopied) {
      game.copySequence(event.sequence);
      yield GameStateNoneActive(game.gameData, game.trial, game.submits, game.fieldsColors);
    }
  }

  Stream<GameState> _mapAnswerAddedToState(AnswerAdded event) async*{
    await game.push();
    if (game.gameEnd != null) {
      yield GameStateGameOver(game.gameData, game.trial, game.submits, game.sequence, game.gameEnd);
    } else {
      yield GameStateNoneActive(game.gameData, game.trial, game.submits, game.fieldsColors);
    }
  }

  Stream<GameState> _mapColorChangedToState(ColorChanged event) async*{
    game.changeColor(event.fieldNumber, event.color);
    if (game.activeField != null) {
      yield GameStateOneActive(game.gameData, game.trial, game.submits, game.fieldsColors, game.activeField, game.pushable);
    } else {
      yield GameStateNoneActive(game.gameData, game.trial, game.submits, game.fieldsColors);
    }
  }

  Stream<GameState> _mapActivityChangedToState(ActivityChanged event) async*{
    game.changeActivity(event.field);
    if (game.activeField != null) {
      yield GameStateOneActive(game.gameData, game.trial, game.submits, game.fieldsColors, game.activeField, game.pushable);
    } else {
      yield GameStateNoneActive(game.gameData, game.trial, game.submits, game.fieldsColors);
    }
  }
}