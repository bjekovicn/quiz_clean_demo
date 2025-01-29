import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'rankings_events.dart';
import '/ui/rankings/state/rankings_state.dart';
import '/data/rankings/domain/repositories/rankings_repository.dart';

@injectable
class RankingsBloc extends Bloc<RankingsEvent, RankingsState> {
  final RankingsRepository _rankingsRepository;

  RankingsBloc(
    @Named('CachedRankingsRepository') this._rankingsRepository,
  ) : super(const RankingsStateIdle()) {
    on<GetAllTimeRankedUsersEvent>(_onGetAllTimeRankedUsers);
  }

  Future<void> _onGetAllTimeRankedUsers(
    RankingsEvent event,
    Emitter<RankingsState> emit,
  ) async {
    emit(const RankingsStateLoading());
    final response = await _rankingsRepository.getAllTimeRankedUsers();

    response.fold(
      (error) => emit(RankingsStateError(error)),
      (data) => emit(RankingsStateDone(data)),
    );
  }
}
