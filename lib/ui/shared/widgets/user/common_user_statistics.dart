import 'package:flutter/material.dart';

import '/data/shared/domain/entities/user_entity.dart';

class CommonUserStatistics extends StatelessWidget {
  const CommonUserStatistics({super.key, required this.model});
  final UserEntity model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 4,
          ),
          child: Row(
            children: [
              Text(
                "${model.coins}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(width: 2),
              const Icon(
                Icons.lightbulb_circle_outlined,
                color: Colors.amber,
                size: 18,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(
          "won:${model.gamesWon}  lost:${model.gamesLost}",
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
