import '/data/game/domain/entities/game/game_end_entity.dart';
import '/data/game/domain/entities/game/round_end_entity.dart';
import '/data/game/domain/entities/game/round_start_entity.dart';

class GameChannelSubscriptionEntity {
  final String roomId;
  final void Function(RoundStartEntity) onRoundStart;
  final void Function(RoundEndEntity) onRoundEnd;
  final void Function(GameEndEntity) onGameEnd;

  GameChannelSubscriptionEntity({
    required this.roomId,
    required this.onRoundStart,
    required this.onRoundEnd,
    required this.onGameEnd,
  });
}
