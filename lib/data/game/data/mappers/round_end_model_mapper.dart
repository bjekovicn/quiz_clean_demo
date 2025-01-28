import '/data/game/data/models/round_end_model.dart';
import '/data/game/domain/entities/game/round_end_entity.dart';
import '/data/game/data/mappers/round_result_model_mapper.dart';

extension RoundEndModelMapper on RoundEndModel {
  RoundEndEntity mapToEntity() {
    return RoundEndEntity(
      round: rd,
      roundResults: rs.map((model) => model.mapToEntity()).toList(),
    );
  }
}
