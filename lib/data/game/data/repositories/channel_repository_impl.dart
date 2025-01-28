import 'package:fpdart/fpdart.dart';

import '/core/error_handling/failure.dart';
import '/data/game/domain/repositories/channel_repository.dart';
import '/data/game/data/data_sources/remote/pub_sub_service.dart';

class ChannelRepositoryImpl implements ChannelRepository {
  final PubSubService _pubSubService;

  ChannelRepositoryImpl(this._pubSubService);

  @override
  Future<Either<Failure, void>> publishToChannel({
    required String channelId,
    required String message,
  }) async {
    try {
      await _pubSubService.publishToChannel(
        channelId: channelId,
        message: message,
      );
      return const Right(null);
    } catch (exception) {
      return Left(Failure.handle(exception));
    }
  }

  @override
  Either<Failure, void> unsubscribeFromChannel({
    required String channelId,
  }) {
    try {
      _pubSubService.unsubscribeFromChannel(
        channelId: channelId,
      );
      return const Right(null);
    } catch (exception) {
      return Left(Failure.handle(exception));
    }
  }
}
