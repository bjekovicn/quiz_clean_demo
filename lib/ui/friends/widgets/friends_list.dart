import 'package:flutter/material.dart';

import '/core/extensions/extensions.dart';
import '/ui/friends/widgets/friend_pop_up_menu.dart';
import '/ui/shared/widgets/user/common_user_tile.dart';
import '/data/shared/domain/entities/user_entity.dart';

class FriendsList extends StatelessWidget {
  const FriendsList({
    super.key,
    required this.isLoading,
    required this.users,
  });

  final bool isLoading;
  final List<UserEntity>? users;

  @override
  Widget build(BuildContext context) {
    //
    if (users != null && users!.isEmpty) {
      return Center(
        child: Text(context.l.no_friends_found),
      );
    }

    return ListView(
      children: [
        if (isLoading || users == null)
          ...List.generate(
            20,
            (_) => const CommonUserCardShimmer(),
          )
        else
          ...users!.map(
            (model) {
              return CommonUserTile(
                model: model,
                trailing: FriendPopUpMenu(
                  userId: model.userId,
                ),
              );
            },
          ),
      ],
    );
  }
}
