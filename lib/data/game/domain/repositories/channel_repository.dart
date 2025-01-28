import 'package:fpdart/fpdart.dart';

import '/core/error_handling/failure.dart';

abstract class ChannelRepository {
  Either<Failure, void> unsubscribeFromChannel({
    required String channelId,
  });

  Future<Either<Failure, void>> publishToChannel({
    required String channelId,
    required String message,
  });
}
