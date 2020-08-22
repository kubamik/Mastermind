import 'package:equatable/equatable.dart';

abstract class GameEvent extends Equatable {
  final List<dynamic> other;
  GameEvent([this.other = const []]);

  List<Object> get props => const [];
}

class StartGame extends GameEvent {
  final int fieldCount, colorCount, trialCount;
  final bool allowRepeat, allowEmpty;
  StartGame([this.fieldCount,
    this.colorCount,
    this.trialCount,
    this.allowRepeat,
    this.allowEmpty]);
  @override
  String toString() => 'StartGame';
}

class AnswerAdded extends GameEvent {
  @override
  String toString() => 'AnswerAdded';
}

class ColorChanged extends GameEvent {
  final int color, fieldNumber;
  ColorChanged({this.color, this.fieldNumber}): super([color, fieldNumber]);

  @override
  String toString() => 'ColorChanged';
}

class ActivityChanged extends GameEvent {
 final int field;
 ActivityChanged(this.field): super([field]);

  @override
  String toString() => 'ActivityChanged';
}

class GameOver extends GameEvent {
  @override
  String toString() => 'GameOver';
}