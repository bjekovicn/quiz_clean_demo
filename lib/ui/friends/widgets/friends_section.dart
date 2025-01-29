import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'friends_list.dart';
import '/ui/friends/state/friends_bloc.dart';
import '/ui/friends/state/friends_event.dart';
import '/ui/friends/state/friends_state.dart';
import '/ui/shared/widgets/common_error.dart';

class FriendsSection extends StatefulWidget {
  const FriendsSection({super.key});

  @override
  State<FriendsSection> createState() => _FriendsSectionSectionState();
}

class _FriendsSectionSectionState extends State<FriendsSection> {
  @override
  void initState() {
    final friendsBloc = context.read<FriendsBloc>();
    friendsBloc.add(GetFriendsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendsBloc, FriendsState>(
      builder: (_, state) {
        if (state is FriendshipsStateError) {
          return CommonError(failure: state.failure);
        }

        return FriendsList(
          isLoading: state is FriendshipsStateLoading,
          users: state.users,
        );
      },
    );
  }
}
