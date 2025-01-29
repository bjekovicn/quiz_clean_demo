import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/utils/helpers.dart';
import '/core/extensions/extensions.dart';
import '/ui/game_play/bloc/game_bloc.dart';
import '/ui/game_play/bloc/game_states.dart';
import '/ui/game_play/widgets/score_footer.dart';
import '/data/game/domain/entities/player_entity.dart';
import '/ui/shared/widgets/user/common_user_card.dart';
import '/data/game/domain/entities/game/game_end_entity.dart';

class GameEndSection extends StatelessWidget {
  const GameEndSection({
    super.key,
    required this.gameEndEntity,
  });
  final GameEndEntity gameEndEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'END GAME',
              style: context.textTheme.displaySmall,
            ),
            const SizedBox(height: 60),
            BlocBuilder<GameBloc, GameState>(
              buildWhen: (_, current) => current is GameEndState,
              builder: (_, state) {
                List<PlayerEntity> sortedPlayers = [];

                if (state is GameEndState) {
                  final playerList = state.gameStartEntity.players;
                  final sortedResults = gameEndEntity.gameResultEntity
                    ..sort((a, b) => b.playerScore.compareTo(a.playerScore));

                  // Map sorted results to players based on playerId
                  sortedPlayers = sortedResults.map((result) {
                    final player = playerList.firstWhere(
                      (p) => p.playerId == result.playerId,
                    );
                    return PlayerEntity(
                      playerId: player.playerId,
                      playerName: player.playerName,
                      playerColor: player.playerColor,
                      playerProfilePicture: player.playerProfilePicture,
                    );
                  }).toList();
                }

                return FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: sortedPlayers.asMap().entries.map((entry) {
                      final index = entry.key;
                      final player = entry.value;
                      final playerResult =
                          gameEndEntity.gameResultEntity.firstWhere(
                        (result) => result.playerId == player.playerId,
                      );

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (index == 0)
                            Text(
                              'Winner',
                              style: context.textTheme.headlineSmall,
                            )
                          else
                            const SizedBox(height: 32),
                          const SizedBox(height: 10),
                          CommonUserCard(
                            name: player.playerName,
                            color: fromHex(player.playerColor),
                            image: player.playerProfilePicture,
                            footer: ScoreFooter(
                              score: playerResult.playerScore,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                );
              },
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('BACK'),
            ),
          ],
        ),
      ),
    );
  }
}
