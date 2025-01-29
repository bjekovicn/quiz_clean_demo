import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/game_play/bloc/game_bloc.dart';
import '/ui/game_play/bloc/game_events.dart';
import '/ui/game_play/bloc/game_states.dart';
import '/ui/game_play/widgets/answer_button_player_times.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({
    super.key,
    required this.type,
    required this.answer,
  });

  final String type;
  final String answer;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  List<Color> playerColors = [];
  List<double> colorStops = [];
  double elevation = 2.0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameBloc, GameState>(
      listener: (context, state) {
        if (state is RoundStartState) {
          _handleRoundStart(state);
        }
        if (state is RoundEndState) {
          _handleRoundEnd(state);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 4),
              child: InkWell(
                onTap: () {
                  final gameBloc = context.read<GameBloc>();
                  if (state is RoundEndState ||
                      gameBloc.state is RoundAnswerState) return;
                  setState(() {
                    playerColors = [Colors.blue];
                    colorStops = [1.0];
                    elevation = 10.0;
                  });
                  gameBloc.add(RoundAnswerEvent(widget.type));
                },
                onTapDown: (_) => setState(() => elevation = 2.0),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: playerColors.isNotEmpty
                          ? playerColors
                          : [Colors.grey, Colors.grey],
                      stops: colorStops.isNotEmpty ? colorStops : [0.5, 1.0],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        blurRadius: 4,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    widget.answer,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            // PLAYER TIMES
            if (state is RoundEndState)
              Positioned(
                top: 0,
                left: 0,
                child: AnswerButtonPlayerTimes(
                  type: widget.type,
                ),
              ),
          ],
        );
      },
    );
  }

  void _handleRoundStart(RoundStartState state) {
    setState(() {
      playerColors = [Colors.grey, Colors.grey];
      colorStops = [0.5, 1.0];
      elevation = 2.0;
    });
  }

  void _handleRoundEnd(RoundEndState state) async {
    if (widget.type != 'A') return;
    const List<Color> correctColors = [Colors.amber, Colors.amber];
    const List<Color> defaultColors = [Colors.grey, Colors.grey];
    const Duration flashDuration = Duration(milliseconds: 400);

    setState(() {
      playerColors = correctColors;
      colorStops = [0.5, 1.0];
      elevation = 2.0;
    });
    await Future.delayed(flashDuration);

    setState(() {
      playerColors = defaultColors;
      colorStops = [0.5, 1.0];
      elevation = 2.0;
    });
    await Future.delayed(flashDuration);

    setState(() {
      playerColors = correctColors;
      colorStops = [0.5, 1.0];
      elevation = 2.0;
    });
  }
}
