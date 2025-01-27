import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_events.dart';
import '/ui/home/state/home_states.dart';
import '/core/error_handling/failure.dart';
import '/data/user/domain/repositories/users_repository.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UsersRepository _repository;

  HomeBloc(
    @Named('CachedUsersRepository') this._repository,
  ) : super(const HomeStateIdle()) {
    on<GetCurrentUserEvent>(_onGetCurrentUser);
  }

  Future<void> _onGetCurrentUser(
    GetCurrentUserEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeStateLoading());
    final response = await _repository.getCurrentUser();

    response.fold(
      (failure) => emit(HomeStateError(failure)),
      (user) => emit(HomeStateDone(user)),
    );
  }

  Future<Either<Failure, String>> createGameRoom() async {
    //TODO Add implementation
    throw UnimplementedError();
  }
}
