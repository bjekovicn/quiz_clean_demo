import 'dart:convert';
import 'dart:developer';

import 'package:fpdart/fpdart.dart';

import '/core/error_handling/failure.dart';
import '/data/game/data/models/game_end_model.dart';
import '/data/game/data/models/round_end_model.dart';
import '/data/game/data/mappers/game_end_mapper.dart';
import '/data/game/data/models/game_start_model.dart';
import '/data/game/data/models/round_start_model.dart';
import '/data/game/data/mappers/game_start_mapper.dart';
import '/data/game/domain/repositories/game_repository.dart';
import '/data/game/data/mappers/round_end_model_mapper.dart';
import '/data/game/domain/entities/game/game_end_entity.dart';
import '/data/game/data/mappers/round_start_model_mapper.dart';
import '/data/game/domain/entities/game/round_end_entity.dart';
import '/data/game/domain/entities/game/game_start_entity.dart';
import '/data/game/domain/entities/game/round_start_entity.dart';
import '/data/game/data/data_sources/remote/pub_sub_service.dart';

class GameRepositoryImpl implements GameRepository {
  final int userId;
  final String languageCode;
  final PubSubService _pubSubService;

  GameRepositoryImpl(
    this._pubSubService,
    this.languageCode,
    this.userId,
  );

  @override
  Future<Either<Failure, void>> subscribeToGameRoomChannel({
    required String roomId,
    required Function(RoundStartEntity p1) onRoundStart,
    required Function(RoundEndEntity p1) onRoundEnd,
    required Function(GameEndEntity p1) onGameEnd,
  }) async {
    try {
      await _pubSubService.subscribeToChannel(
        channelId: roomId,
        onMessage: (message) {
          if (message[0] != 'message') return 'Incorrect Message Type';

          final value = jsonDecode(message[2]) as Map<String, dynamic>;

          final type = value["t"] as String;
          final rawData = value["d"];

          switch (type) {
            case 'RS':
              final roundStartModel = RoundStartModel.fromJson(rawData);
              onRoundStart(roundStartModel.mapToEntity());
              break;
            case 'RE':
              final roundEndModel = RoundEndModel.fromJson(rawData);
              onRoundEnd(roundEndModel.mapToEntity());
              break;
            case 'GE':
              final gameEndModel = GameEndModel.fromJson(rawData);
              onGameEnd(gameEndModel.mapToEntity());

              _pubSubService.unsubscribeFromChannel(channelId: '$userId');
              _pubSubService.unsubscribeFromChannel(channelId: gameEndModel.id);
              break;

            default:
              log('Unknown Game Room Channel Message: $value]}');
          }
        },
      );
      return const Right(null);
    } catch (exception) {
      return Left(Failure.handle(exception));
    }
  }

  @override
  Future<Either<Failure, void>> subscribeToUserChannel({
    required String userId,
    required Function(GameStartEntity data) onGameStart,
  }) async {
    try {
      await _pubSubService.subscribeToChannel(
        channelId: userId,
        onMessage: (message) {
          if (message[0] != 'message') return 'Incorrect Message Type';

          final value = jsonDecode(message[2]) as Map<String, dynamic>;
          final type = value["t"] as String;
          final rawData = value["d"];

          switch (type) {
            case 'GS':
              final model = GameStartModel.fromJson(rawData);
              onGameStart(model.mapToEntity());
              break;

            default:
              log('Unknown QUEUE Channel Message: $value]}');
          }
        },
      );
      return const Right(null);
    } catch (exception) {
      return Left(Failure.handle(exception));
    }
  }
}
