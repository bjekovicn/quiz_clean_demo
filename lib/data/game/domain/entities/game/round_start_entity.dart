import '/data/game/domain/entities/question_entity.dart';

class RoundStartEntity {
  final int round;
  final QuestionEntity questionEntity;
  RoundStartEntity({
    required this.round,
    required this.questionEntity,
  });
}
