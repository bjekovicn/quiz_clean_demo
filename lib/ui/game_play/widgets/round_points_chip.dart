import 'package:flutter/material.dart';

class RoundPointsChip extends StatelessWidget {
  const RoundPointsChip({
    super.key,
    required this.points,
  });

  final int points;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 30,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.purple,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "+$points",
            style: const TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 16,
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
    );
  }
}
