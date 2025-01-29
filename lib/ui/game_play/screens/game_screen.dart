import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/game_play/bloc/game_bloc.dart';
import '/ui/game_play/bloc/game_events.dart';
import '/ui/game_play/bloc/game_states.dart';
import '/ui/game_play/widgets/lobby_section.dart';
import '/ui/game_play/widgets/timer_section.dart';
import '/ui/game_play/widgets/players_section.dart';
import '/ui/game_play/widgets/question_section.dart';
import '/ui/game_play/widgets/game_end_section.dart';
import '/ui/game_play/widgets/round_info_section.dart';
import '/ui/game_play/widgets/round_index_indicators.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final GameBloc provider;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider = context.read<GameBloc>();
      provider.add(SubscribeToUserChannelEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      buildWhen: (_, current) {
        return !(current is RoundStartState && current is RoundEndState);
      },
      builder: (_, state) {
        if (state is GameInitial || state is SocketConnected) {
          return const LobbySection();
        }

        if (state is GameEndState) {
          return GameEndSection(
            gameEndEntity: state.gameEndEntity,
          );
        }

        //

        return const Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlayersSection(),
                SizedBox(height: 20),
                RoundInfoSection(),
                RoundIndexIndicators(),
                TimerSection(),
                SizedBox(height: 60),
                QuestionSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}
