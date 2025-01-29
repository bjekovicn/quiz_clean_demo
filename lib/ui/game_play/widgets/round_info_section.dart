import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/utils/helpers.dart';
import '/ui/game_play/bloc/game_bloc.dart';
import '/ui/game_play/bloc/game_states.dart';
import '/ui/shared/widgets/common_image.dart';

class RoundInfoSection extends StatelessWidget {
  const RoundInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      buildWhen: (_, currentState) {
        return currentState is RoundEndState || currentState is RoundStartState;
      },
      builder: (_, state) {
        if (state is RoundEndState) {
          final playerResults = state.roundEndEntity.roundResults
              .where((a) => a.playerPoints != 0)
              .toList();

          playerResults.sort((a, b) {
            return b.playerPoints.compareTo(a.playerPoints);
          });

          return SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...playerResults.map((playerResult) {
                  //MATCHING PLAYER INFO
                  final player = state.gameStartEntity.players.firstWhere(
                    (player) => playerResult.playerId == player.playerId,
                  );

                  return ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 60,
                      maxWidth: 90,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "+${playerResult.playerPoints} points",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          height: 34,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: fromHex(player.playerColor),
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                offset: const Offset(2, 4),
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              CommonImage(
                                size: 24,
                                url: player.playerProfilePicture,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: FittedBox(
                                  child: Text(
                                    player.playerName,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
          );
        }

        return const SizedBox(height: 60);
      },
    );
  }
}
