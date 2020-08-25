import 'package:dart_random_choice/dart_random_choice.dart';

import 'package:mastermind/game/game_constants.dart';
import 'package:mastermind/game/game_utils.dart';

Game game;

class Game {
  final int fieldCount, colorCount, trialCount;
  final bool allowRepeat, allowEmpty;
  List<int> sequence, colors;

  var trial = 1;
  int activeField;
  List<int> fieldsColors;
  List<List<List<int>>> submits = [];
  String gameEnd;

  Game(
      [this.fieldCount = 4,
      this.colorCount = 6,
      this.trialCount = 10,
      this.allowRepeat = true,
      this.allowEmpty = false]) {
    fieldsColors = List.filled(fieldCount, defaultColor);
    colors = allColors.sublist(0, colorCount);
    List<int> colorSet = colors;
    if (allowEmpty) {
      colorSet += [defaultColor];
    }
    if (allowRepeat) {
      sequence = [for (var i = 0; i < fieldCount; i++) randomChoice(colorSet)];
    } else {
      this.sequence = (colorSet
        ..shuffle())
        .sublist(0, fieldCount);
    }
  }

  bool get pushable => (allowEmpty ? true : !(fieldsColors.contains(defaultColor))) && (allowRepeat
      ? true
      : Set.from(fieldsColors).length == fieldsColors.length);

  List<dynamic> get gameData => [trialCount, colors];

  void changeColor(int fieldNum, int color) => fieldsColors[fieldNum ?? activeField] = color ?? defaultColor;
  void changeActivity(int fieldNum) =>
      activeField = fieldNum != activeField ? fieldNum : null;
  void surrender() => gameEnd = gameLossText;
  void copySequence(List<int> sequence) {
    fieldsColors = sequence;
    activeField = null;
  }

  Future<void> push() async{
    if (listsEqual(sequence, fieldsColors)) {
      gameEnd = gameWonText;
      submits.add([sequence, List.filled(fieldCount, guessedFieldColor)]);
      return;
    }
    if (trial == trialCount) {
      gameEnd = gameLossText;
    } else {
      trial++;
    }
    var back = compareSequences(sequence, fieldsColors);
    submits.add([fieldsColors, back]);
    fieldsColors = List.filled(fieldCount, defaultColor);
    activeField = null;
  }
}
