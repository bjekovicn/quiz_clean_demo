import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/home/state/home_bloc.dart';
import '/ui/home/state/home_events.dart';
import '/ui/home/state/home_states.dart';
import '/ui/home/widgets/user_info_card.dart';
import '/ui/shared/widgets/common_error.dart';
import '/ui/home/widgets/user_info_card_shimmer.dart';

class UserInfoSection extends StatefulWidget {
  const UserInfoSection({super.key});

  @override
  State<UserInfoSection> createState() => _UserInfoSectionState();
}

class _UserInfoSectionState extends State<UserInfoSection> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetCurrentUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) {
        //
        if (state is HomeStateError) {
          return CommonError(failure: state.failure);
        }

        if (state is HomeStateLoading || state is HomeStateIdle) {
          return const UserInfoCardShimmer();
        }
        return UserInfoCard(
          isLoading: state is HomeStateLoading,
          user: state.user,
        );
      },
    );
  }
}
