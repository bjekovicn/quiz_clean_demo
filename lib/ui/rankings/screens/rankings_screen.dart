import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/shared/widgets/common_error.dart';
import '/ui/rankings/state/rankings_bloc.dart';
import '/ui/rankings/state/rankings_state.dart';
import '/ui/rankings/state/rankings_events.dart';
import '/ui/rankings/widgets/rankings_list.dart';

class RankingsScreen extends StatefulWidget {
  const RankingsScreen({super.key});

  @override
  State<RankingsScreen> createState() => _RankingsScreenState();
}

class _RankingsScreenState extends State<RankingsScreen> {
  @override
  void initState() {
    final rankingsBloc = context.read<RankingsBloc>();
    rankingsBloc.add(GetAllTimeRankedUsersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Time Rankings',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: BlocBuilder<RankingsBloc, RankingsState>(
        builder: (_, state) {
          if (state is RankingsStateError) {
            return CommonError(failure: state.failure);
          }

          return RankingsList(
            users: state.users,
            isLoading: state is RankingsStateLoading,
          );
        },
      ),
    );
  }
}
