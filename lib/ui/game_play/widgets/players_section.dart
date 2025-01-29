import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/utils/helpers.dart';
import '/ui/game_play/bloc/game_bloc.dart';
import '/ui/game_play/bloc/game_states.dart';
import '/ui/game_play/widgets/score_footer.dart';
import '/ui/shared/widgets/user/common_user_card.dart';
import '/data/game/domain/entities/player_entity.dart';
import '/data/game/domain/entities/round_result_entity.dart';

class PlayersSection extends StatefulWidget {
  const PlayersSection({super.key});

  @override
  State<PlayersSection> createState() => _PlayersSectionState();
}

class _PlayersSectionState extends State<PlayersSection> {
  var allPlayers = <PlayerEntity>[];
  var allResults = <RoundResultEntity>[];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      buildWhen: (_, state) {
        return state is GameStartState || state is RoundStartState;
      },
      builder: (_, state) {
        if (state is GameStartState) {
          final playerList = state.gameStartEntity.players;
          final currentUser = playerList.firstWhere(
            (p) => p.playerId == state.gameStartEntity.playerId,
          );
          final otherPlayers = playerList.where(
            (p) => p.playerId != state.gameStartEntity.playerId,
          );

          allPlayers = [currentUser, ...otherPlayers];
        }

        if (state is RoundEndState) {
          allResults = state.roundEndEntity.roundResults;
        }

        return SafeArea(
          child: SizedBox(
            height: 120,
            child: FittedBox(
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...allPlayers.map(
                      (player) {
                        final playerResult = allResults.firstWhere(
                          (result) => result.playerId == player.playerId,
                          //FIRST ROUND CASE
                          orElse: () => RoundResultEntity(
                            playerId: player.playerId,
                            playerScore: 0,
                            playerPoints: 0,
                            playerAnswer: null,
                            playerTimeDifference: 0,
                          ),
                        );

                        return CommonUserCard(
                          name: player.playerName,
                          image: player.playerProfilePicture,
                          color: fromHex(player.playerColor),
                          footer: ScoreFooter(
                            score: playerResult.playerScore,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
