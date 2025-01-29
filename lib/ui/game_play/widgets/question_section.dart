import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/game_play/bloc/game_bloc.dart';
import '/ui/game_play/bloc/game_states.dart';
import '/ui/shared/widgets/common_loading.dart';
import '/ui/game_play/widgets/answer_button.dart';
import '/data/game/domain/entities/question_entity.dart';

class QuestionSection extends StatefulWidget {
  const QuestionSection({super.key});

  @override
  State<QuestionSection> createState() => _QuestionSectionState();
}

class _QuestionSectionState extends State<QuestionSection> {
  QuestionEntity? _questionEntity;
  final questionButtons = <AnswerButton>[];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      buildWhen: (_, current) {
        return current is RoundAnswerState || current is RoundStartState;
      },
      builder: (_, state) {
        if (state is RoundStartState) {
          _questionEntity = state.roundStartEntity.questionEntity;
          questionButtons.clear();
          questionButtons.addAll([
            AnswerButton(
              type: 'A',
              answer: _questionEntity!.answerA,
            ),
            AnswerButton(
              type: 'B',
              answer: _questionEntity!.answerB,
            ),
            AnswerButton(
              type: 'C',
              answer: _questionEntity!.answerC,
            ),
          ]);
          questionButtons.shuffle();
        }

        if (_questionEntity == null) {
          return Container(
            height: 334,
            margin: const EdgeInsets.only(bottom: 30),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: const Column(
              children: [
                CommonLoading(
                  text: 'The game will start soon',
                ),
              ],
            ),
          );
        }

        return Container(
          height: 334,
          margin: const EdgeInsets.only(bottom: 30),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              SizedBox(
                height: 90,
                child: Text(
                  _questionEntity!.question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ...questionButtons,
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}
