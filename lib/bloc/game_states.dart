abstract class GameState {
  final List<Object> gameData, other;
  final int trial, activeField = null;
  final List<List<List<int>>> submits;
  final List<int> fieldsColors = const [];

  GameState(this.gameData, this.trial, this.submits, {this.other = const []});

  int get trialCount => gameData[0];
  List<int> get colors => gameData[1];
}

class GameStateAnswerAdded extends GameState {

  GameStateAnswerAdded(List<dynamic> gameData, int trial, List<List<List<int>>> submits): super(gameData, trial, submits);

  @override
  String toString() => 'GameStateAnswerAdded';
}

class GameStateNoneActive extends GameState {

  final List<int> fieldsColors;
  GameStateNoneActive(List<dynamic> gameData, int trial, List<List<List<int>>> submits, this.fieldsColors): super(gameData, trial, submits, other: [fieldsColors]);

  @override
  String toString() => 'GameStateNoneActive';
}

class GameStateOneActive extends GameState {

  final bool pushable;
  final int activeField;
  final List<int> fieldsColors;
  GameStateOneActive(List<dynamic> gameData, int trial, List<List<List<int>>> submits, this.fieldsColors, this.activeField, this.pushable): super(gameData, trial, submits, other: [fieldsColors, activeField, pushable]);

  @override
  String toString() => 'GameStateOneActive';
}

class GameStateGameOver extends GameState {

  final List<int> sequence;
  final String message;
  GameStateGameOver(List<dynamic> gameData, int trial, List<List<List<int>>> submits, this.sequence, this.message): super(gameData, trial, submits, other: [sequence, message]);

  @override
  String toString() => 'GameStateGameOver';
}