import 'package:flutter/material.dart';

import '/core/extensions/extensions.dart';
import '/ui/shared/widgets/common_value_chip.dart';
import '/data/shared/domain/entities/user_entity.dart';
import '/ui/shared/widgets/user/common_user_image.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    super.key,
    required this.isLoading,
    required this.user,
  });
  final bool isLoading;
  final UserEntity? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${context.l.welcome}, ${user?.firstName ?? ''}',
              style: context.textTheme.headlineMedium!.copyWith(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CommonValueChip(
                label: context.l.coins,
                value: user?.coins ?? 0,
                iconData: Icons.lightbulb_circle_outlined,
              ),
              CommonUserImage(
                imageUrl: user?.googlePhoto,
              ),
              CommonValueChip(
                label: context.l.tokens,
                value: user?.tokens ?? 0,
                iconData: Icons.circle_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
