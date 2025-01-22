import 'package:flutter/material.dart';

import '/ui/rankings/widgets/user_rank.dart';
import '/data/shared/domain/entities/user_entity.dart';
import '/ui/shared/widgets/user/common_user_tile.dart';

class RankingsList extends StatelessWidget {
  final bool isLoading;
  final List<UserEntity>? users;

  const RankingsList({
    super.key,
    required this.isLoading,
    this.users,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: [
        //
        if (isLoading)
          ...List.generate(
            20,
            (_) => const CommonUserCardShimmer(
              trailing: UserRankShimmer(),
            ),
          ),
        //

        if (!isLoading && users != null)
          ...users!.map(
            (model) => CommonUserTile(
              model: model,
              trailing: UserRank(
                rank: users!.indexOf(model),
              ),
            ),
          ),
      ],
    );
  }
}
