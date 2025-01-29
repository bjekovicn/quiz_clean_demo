import 'package:flutter/material.dart';

import '/core/extensions/extensions.dart';

class ScoreFooter extends StatelessWidget {
  const ScoreFooter({
    super.key,
    required this.score,
  });
  final int score;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '${score}x',
          style: context.textTheme.titleLarge!.copyWith(
            color: Colors.amber,
          ),
        ),
        const Icon(
          Icons.lightbulb_circle_outlined,
          color: Colors.amber,
          size: 24,
        ),
      ],
    );
  }
}
