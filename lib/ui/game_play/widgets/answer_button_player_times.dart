import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/utils/helpers.dart';
import '/ui/game_play/bloc/game_bloc.dart';
import '/ui/game_play/bloc/game_states.dart';
import '/data/game/domain/entities/player_entity.dart';

class AnswerButtonPlayerTimes extends StatelessWidget {
  const AnswerButtonPlayerTimes({
    super.key,
    required this.type,
  });
  final String type;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      buildWhen: (_, current) => current is RoundEndState,
      builder: (_, state) {
        if (state is RoundEndState) {
          final players = state.gameStartEntity.players;
          final results = state.roundEndEntity.roundResults;

          final validRoundResults = results.where((result) {
            return result.playerTimeDifference != null &&
                result.playerAnswer == type;
          }).toList();
          //
          validRoundResults.sort((a, b) {
            return a.playerTimeDifference!.compareTo(b.playerTimeDifference!);
          });

          return Row(
            children: validRoundResults.map(
              (result) {
                PlayerEntity? matchingPlayer;
                for (var player in players) {
                  if (player.playerId == result.playerId) {
                    matchingPlayer = player;
                    break;
                  }
                }

                Color playerColor = Colors.red;
                if (matchingPlayer?.playerColor != null) {
                  playerColor = fromHex(matchingPlayer!.playerColor);
                }

                return Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(7),
                    child: Container(
                      height: 20,
                      width: 44,
                      margin: const EdgeInsets.all(1),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: playerColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        '${result.playerTimeDifference!.toStringAsFixed(1)} s',
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          );
        }
        return const SizedBox();
      },
    );
  }
}
