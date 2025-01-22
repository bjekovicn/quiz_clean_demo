import 'package:flutter_bloc/flutter_bloc.dart';

import '/injection.dart';
import '/ui/home/screens/home_screen.dart';
import '/ui/rankings/state/rankings_bloc.dart';
import '/ui/friends/screens/friends_screen.dart';
import '/ui/rankings/screens/rankings_screen.dart';
import '/ui/navigation/state/main_navigation_events.dart';
import '/ui/navigation/state/main_navigation_states.dart';

class MainNavigationBloc
    extends Bloc<MainNavigationEvent, MainNavigationState> {
  static final _screens = [
    //HOME SCREEN
    HomeScreen(),

    //FRIENDS SCREEN
    FriendsScreen(),

    //RANKINGS SCREEN
    BlocProvider(
      create: (_) => getIt<RankingsBloc>(),
      child: RankingsScreen(),
    ),
  ];

  //
  MainNavigationBloc() : super(const MainNavigationInitialState()) {
    on<SelectTabEvent>(_onSelectTab);
  }

  void _onSelectTab(
    SelectTabEvent event,
    Emitter<MainNavigationState> emit,
  ) {
    emit(
      MainNavigationLoadedState(
        selectedIndex: event.index,
        selectedWidget: _screens[event.index],
      ),
    );
  }
}
