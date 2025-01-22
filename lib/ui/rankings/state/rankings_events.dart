abstract class RankingsEvent {
  const RankingsEvent();
}

class GetAllTimeRankedUsersEvent extends RankingsEvent {}

class GetWeeklyRankedUsersEvent extends RankingsEvent {}

class GetMonthlyRankedUsersEvent extends RankingsEvent {}
