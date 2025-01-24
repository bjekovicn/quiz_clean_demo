import 'package:fpdart/fpdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'friends_event.dart';
import '/core/error_handling/failure.dart';
import '/ui/friends/state/friends_state.dart';
import '/data/friendships/domain/repositories/friendships_repository.dart';

@injectable
class FriendsBloc extends Bloc<FriendsEvent, FriendsState> {
  final FriendshipsRepository _repository;

  FriendsBloc(
    @Named('CachedFriendshipsRepository') this._repository,
  ) : super(const FriendshipsStateIdle()) {
    on<GetFriendsEvent>(_onGetFriends);
  }

  Future<void> _onGetFriends(
    FriendsEvent event,
    Emitter<FriendsState> emit,
  ) async {
    emit(const FriendshipsStateLoading());
    final response = await _repository.getFriends();

    response.fold(
      (failure) => emit(FriendshipsStateError(failure)),
      (data) => emit(FriendshipsStateDone(data)),
    );
  }

  Future<Either<Failure, void>> removeFriend(int userId) async {
    return await _repository.removeFriend(userId);
  }

  Future<Either<Failure, void>> addFriend(int userId) async {
    return await _repository.addFriend(userId);
  }
}
