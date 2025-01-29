import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/extensions/extensions.dart';
import '/ui/game_play/bloc/game_bloc.dart';
import '/ui/game_play/bloc/game_states.dart';

class RoundIndexIndicators extends StatefulWidget {
  const RoundIndexIndicators({super.key});

  @override
  State<RoundIndexIndicators> createState() => _RoundIndexIndicatorsState();
}

class _RoundIndexIndicatorsState extends State<RoundIndexIndicators> {
  int _totalRounds = 0;
  int _currentRound = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      buildWhen: (_, currentState) {
        return currentState is RoundEndState ||
            currentState is RoundStartState ||
            currentState is GameStartState;
      },
      builder: (_, state) {
        //
        if (state is GameStartState) {
          _totalRounds = state.gameStartEntity.totalRounds;
        }

        if (state is RoundEndState) {
          _currentRound = state.roundEndEntity.round;
        }

        return SizedBox(
          height: 30,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              ...List.generate(
                _totalRounds,
                (index) {
                  final isAnswered = _currentRound > index;

                  //ANSWERED
                  if (isAnswered) {
                    return Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            blurRadius: 4,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      child: const Center(child: Icon(Icons.close)),
                    );
                  }

                  //NOT ANSWERED
                  return Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.6),
                          blurRadius: 4,
                          offset: const Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
