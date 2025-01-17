import 'package:flutter/material.dart';

import '../common_image.dart';
import '/core/extensions/extensions.dart';

class CommonUserCard extends StatelessWidget {
  const CommonUserCard({
    super.key,
    required this.name,
    required this.image,
    required this.color,
    required this.footer,
  });
  final String? image;
  final String? name;
  final Widget footer;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 80,
          height: 112,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.purple,
            border: Border.all(
              color: Colors.amber,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                offset: const Offset(2, 4),
                color: Colors.black.withValues(alpha: 0.6),
              ),
            ],
          ),
          alignment: Alignment.bottomCenter,
          child: footer,
        ),
        //USER PICTURE AND NAME CARD
        Positioned(
          top: 3,
          left: 3,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 74,
            height: 78,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(7),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  offset: const Offset(1, 4),
                  color: Colors.black.withValues(alpha: 0.4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 6),
                CommonImage(
                  url: image,
                  size: 44,
                ),
                FittedBox(
                  child: Text(
                    name ?? '',
                    style: context.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
