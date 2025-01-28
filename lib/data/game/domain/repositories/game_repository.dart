import 'package:fpdart/fpdart.dart';

import '/core/error_handling/failure.dart';
import '/data/game/domain/entities/game/game_end_entity.dart';
import '/data/game/domain/entities/game/game_start_entity.dart';
import '/data/game/domain/entities/game/round_end_entity.dart';
import '/data/game/domain/entities/game/round_start_entity.dart';

abstract class GameRepository {
  Future<Either<Failure, void>> subscribeToGameRoomChannel({
    required String roomId,
    required Function(RoundStartEntity) onRoundStart,
    required Function(RoundEndEntity) onRoundEnd,
    required Function(GameEndEntity) onGameEnd,
  });

  Future<Either<Failure, void>> subscribeToUserChannel({
    required String userId,
    required Function(GameStartEntity) onGameStart,
  });
}
