import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../common_image.dart';
import '/data/shared/domain/entities/user_entity.dart';
import '/ui/shared/widgets/user/common_user_statistics.dart';

class CommonUserTile extends StatelessWidget {
  const CommonUserTile({
    super.key,
    required this.model,
    this.trailing,
  });
  final UserEntity model;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CommonImage(url: model.googlePhoto),
      title: Text(
        '${model.firstName ?? ''} ${model.lastName ?? ''}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: CommonUserStatistics(model: model),
      trailing: trailing,
    );
  }
}

class CommonUserCardShimmer extends StatelessWidget {
  const CommonUserCardShimmer({
    super.key,
    this.trailing,
  });
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: _getRandomWidth(80, 150),
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 51,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 84,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            if (trailing != null) ...[
              trailing!,
              const SizedBox(width: 8),
            ]
          ],
        ),
      ),
    );
  }

  double _getRandomWidth(double minWidth, double maxWidth) {
    final random = Random();
    return minWidth + random.nextDouble() * (maxWidth - minWidth);
  }
}
