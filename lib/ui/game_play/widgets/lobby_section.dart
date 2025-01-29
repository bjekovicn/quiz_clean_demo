import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/extensions/extensions.dart';
import '/ui/game_play/bloc/game_bloc.dart';
import '/ui/game_play/bloc/game_events.dart';
import '/ui/shared/widgets/common_loading.dart';

class LobbySection extends StatelessWidget {
  const LobbySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonLoading(
              text: context.l.game_starting,
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () => _leaveQueue(context),
              child: Text(
                context.l.back,
                style: context.textTheme.bodySmall,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _leaveQueue(BuildContext context) {
    final gameBloc = context.read<GameBloc>();
    gameBloc.add(UnsubscribeFromUserChannelEvent());
    Navigator.of(context).pop();
  }
}
