import '/data/game/domain/entities/game/game_end_entity.dart';
import '/data/game/domain/entities/game/game_start_entity.dart';
import '/data/game/domain/entities/game/round_end_entity.dart';
import '/data/game/domain/entities/game/round_start_entity.dart';

abstract class GameState {}

class GameInitial extends GameState {}

class SocketConnected extends GameState {}

class SocketDisconnected extends GameState {}

class GameStartState extends GameState {
  final GameStartEntity gameStartEntity;
  GameStartState(this.gameStartEntity);
}

class RoundStartState extends GameStartState {
  final RoundStartEntity roundStartEntity;
  RoundStartState(this.roundStartEntity, super.gameStartEntity);
}

class RoundEndState extends GameStartState {
  final RoundEndEntity roundEndEntity;
  RoundEndState(this.roundEndEntity, super.gameStartEntity);
}

class GameEndState extends GameStartState {
  final GameEndEntity gameEndEntity;
  GameEndState(this.gameEndEntity, super.gameStartEntity);
}

class RoundAnswerState extends GameStartState {
  final String answer;
  RoundAnswerState(this.answer, super.gameStartEntity);
}
