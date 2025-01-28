import '/data/game/domain/entities/round_result_entity.dart';

class RoundEndEntity {
  final int round;
  final List<RoundResultEntity> roundResults;

  RoundEndEntity({
    required this.round,
    required this.roundResults,
  });
}
