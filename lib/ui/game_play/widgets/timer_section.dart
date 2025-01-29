import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:quizcleandemo/ui/game_play/bloc/game_bloc.dart';
import 'package:quizcleandemo/ui/game_play/bloc/game_states.dart';

class TimerSection extends StatefulWidget {
  const TimerSection({super.key});

  @override
  State<TimerSection> createState() => _TimerSectionState();
}

class _TimerSectionState extends State<TimerSection>
    with TickerProviderStateMixin {
  late LinearTimerController timerController;

  @override
  void initState() {
    super.initState();
    timerController = LinearTimerController(this);
  }

  @override
  void dispose() {
    timerController.dispose();
    super.dispose();
  }

  void _startTimer() {
    timerController.reset();
    timerController.start();
  }

  void _stopTimer() {
    timerController.stop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameBloc, GameState>(
      listener: (context, state) {
        if (state is RoundStartState) {
          _startTimer();
        } else if (state is RoundEndState) {
          _stopTimer();
        }
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 4,
                  offset: const Offset(1, 2),
                ),
              ],
            ),
            child: LinearTimer(
              minHeight: 8,
              forward: false,
              controller: timerController,
              duration: const Duration(seconds: 10),
            ),
          ),
        ],
      ),
    );
  }
}
