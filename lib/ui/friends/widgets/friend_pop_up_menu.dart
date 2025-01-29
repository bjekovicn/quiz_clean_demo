import 'package:fpdart/fpdart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/utils/common_methods.dart';
import '/core/extensions/extensions.dart';
import '/core/error_handling/failure.dart';
import '/ui/friends/state/friends_bloc.dart';
import '/ui/friends/state/friends_event.dart';
import '/ui/shared/widgets/common_error.dart';

class FriendPopUpMenu extends StatelessWidget {
  const FriendPopUpMenu({
    super.key,
    required this.userId,
  });

  final int userId;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: const Offset(0, -8),
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Padding(
        padding: EdgeInsets.all(6.0),
        child: Icon(Icons.more_vert),
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            onTap: () => _challengeFriend(context),
            child: ListTile(
              title: Text(context.l.challenge_friend),
              trailing: const Icon(
                Icons.device_unknown_outlined,
              ),
            ),
          ),
          PopupMenuItem(
            onTap: () => _removeFriend(context),
            child: ListTile(
              title: Text(context.l.remove_friend),
              trailing: const Icon(
                color: Colors.red,
                Icons.delete_forever_outlined,
              ),
            ),
          )
        ];
      },
    );
  }

  void _challengeFriend(BuildContext context) {
    //TODO add implementation
  }

  void _removeFriend(BuildContext context) {
    callMethodWithLoadingDialogGeneric<Either<Failure, void>>(
      context: context,
      callback: () {
        final friendsBloc = context.read<FriendsBloc>();
        return friendsBloc.removeFriend(userId);
      },
      onFinished: (Either<Failure, void> result) {
        result.fold(
          (Failure failure) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: CommonError(failure: failure)),
          ),
          (void _) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(context.l.removed_success)),
            );
            final bloc = context.read<FriendsBloc>();
            bloc.add(GetFriendsEvent());
          },
        );
      },
    );
  }
}
