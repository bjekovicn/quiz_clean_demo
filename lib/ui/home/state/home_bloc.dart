import 'package:fpdart/fpdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_events.dart';
import '/ui/home/state/home_states.dart';
import '/core/error_handling/failure.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeStateIdle()) {
    on<GetCurrentUserEvent>(_onGetCurrentUser);
  }

  Future<void> _onGetCurrentUser(
    GetCurrentUserEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeStateLoading());
    final response = await _getCurrentUser();

    response.fold(
      (failure) => emit(HomeStateError(failure)),
      (user) => emit(HomeStateDone(user)),
    );
  }

  Future<Either<Failure, String>> createGameRoom() async {
    return await _createFriendsGameRoom();
  }
}
