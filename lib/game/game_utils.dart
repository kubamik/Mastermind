import 'package:mastermind/game/game_constants.dart';

bool listsEqual(List a, List b) {
  if (a.length != b.length) {
    return false;
  }
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) {
      return false;
    }
  }
  return true;
}

int compareColors(int a, int b) {
  if (a == b) {
    return 0;
  }
  if (a == guessedFieldColor) {
    return -1;
  }
  if (b == guessedFieldColor) {
    return 1;
  }
  if (a == guessedWrongPlaceColor) {
    return -1;
  }
  return 1;
}

List<int> compareSequences(List<int> seq, List<int> fld) {
  List<int> list = List.filled(seq.length, defaultColor);
  for (var i = 0; i < fld.length; i++) {
    if (fld[i] == seq[i]) {
      list[i] = guessedFieldColor;
    }
  }
  for (var i = 0; i < fld.length; i++) {
    if (list[i] == guessedFieldColor) {
      continue;
    }
    for (var j = 0; j < seq.length; j++) {
      if (seq[j] == fld[i]) {
        if (list[j] == defaultColor) {
          list[j] = guessedWrongPlaceColor;
          break;
        }
      }
    }
  }
  return list..sort(compareColors);
}
