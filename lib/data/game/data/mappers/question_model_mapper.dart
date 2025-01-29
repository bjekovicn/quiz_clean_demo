import '/data/game/data/models/question_model.dart';
import '/data/game/domain/entities/question_entity.dart';

extension QuestionModelMapper on QuestionModel {
  QuestionEntity mapToEntity() {
    return QuestionEntity(
      question: q,
      answerA: a,
      answerB: b,
      answerC: c,
    );
  }
}
