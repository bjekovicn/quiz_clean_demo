abstract class PubSubService {
  Future<void> unsubscribeFromChannel({
    required String channelId,
  });

  Future<void> publishToChannel({
    required String channelId,
    required String message,
  });

  Future<void> subscribeToChannel({
    required String channelId,
    required Function(dynamic)? onMessage,
  });
}
