import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/extensions/extensions.dart';
import '/ui/navigation/state/main_navigation_bloc.dart';
import '/ui/navigation/state/main_navigation_states.dart';
import '/ui/navigation/state/main_navigation_events.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final navigationBloc = context.read<MainNavigationBloc>();
      navigationBloc.add(SelectTabEvent(0));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainNavigationBloc, MainNavigationState>(
        builder: (_, state) {
          if (state is MainNavigationLoadedState) {
            return Center(child: state.selectedWidget);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: BlocBuilder<MainNavigationBloc, MainNavigationState>(
        builder: (_, state) {
          int currentIndex =
              state is MainNavigationLoadedState ? state.selectedIndex! : 0;

          return BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                label: context.l.home,
                icon: const Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: context.l.friends,
                icon: const Icon(Icons.people_alt_outlined),
              ),
              BottomNavigationBarItem(
                label: context.l.rankings,
                icon: const Icon(Icons.leaderboard_outlined),
              ),
            ],
            currentIndex: currentIndex,
            selectedItemColor: Colors.amber[800],
            onTap: (index) {
              final navigationBloc = context.read<MainNavigationBloc>();
              navigationBloc.add(SelectTabEvent(index));
            },
          );
        },
      ),
    );
  }
}
