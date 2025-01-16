import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '/core/extensions/extensions.dart';

class CommonValueChip extends StatelessWidget {
  const CommonValueChip({
    super.key,
    required this.value,
    required this.iconData,
    this.label,
  });
  final int value;
  final IconData iconData;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: context.textTheme.titleLarge!.copyWith(
              color: Colors.black,
            ),
          ),
        ],
        Container(
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Colors.amber,
              width: 0.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                blurRadius: 4,
                offset: const Offset(2, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 14,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$value",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.amber,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 2),
              Icon(
                iconData,
                size: 18,
                color: Colors.amber,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CommonValueChipShimmer extends StatelessWidget {
  const CommonValueChipShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 50,
            height: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: Colors.amber,
                width: 0.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  blurRadius: 4,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 14,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 14,
                  color: Colors.white,
                ),
                const SizedBox(width: 6),
                Container(
                  width: 18,
                  height: 18,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
