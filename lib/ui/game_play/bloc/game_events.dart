import '/data/game/domain/entities/game/game_end_entity.dart';
import '/data/game/domain/entities/game/game_start_entity.dart';
import '/data/game/domain/entities/game/round_end_entity.dart';
import '/data/game/domain/entities/game/round_start_entity.dart';

abstract class GameEvent {}

class ListenChannelEvent extends GameEvent {}

class SubscribeToUserChannelEvent extends GameEvent {}

class UnsubscribeFromUserChannelEvent extends GameEvent {}

class JoinToMatchMakingQueueEvent extends GameEvent {}

class GameStartEvent extends GameEvent {
  final GameStartEntity gameStartEntity;
  GameStartEvent(this.gameStartEntity);
}

class RoundStartEvent extends GameEvent {
  final RoundStartEntity roundStartEntity;
  RoundStartEvent(this.roundStartEntity);
}

class RoundEndEvent extends GameEvent {
  final RoundEndEntity roundEndEntity;
  RoundEndEvent(this.roundEndEntity);
}

class GameEndEvent extends GameEvent {
  final GameEndEntity gameEndEntity;
  GameEndEvent(this.gameEndEntity);
}

class RoundAnswerEvent extends GameEvent {
  final String answer;
  RoundAnswerEvent(this.answer);
}
