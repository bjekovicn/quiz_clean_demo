import 'dart:developer';

import 'package:redis/redis.dart';

import '/core/di/app_config_module.dart';
import '/data/game/data/data_sources/remote/pub_sub_service.dart';

class PubSubServiceImpl implements PubSubService {
  final AppConfig _appConfig;

  final _pubCommands = <String, Command>{};
  final _subCommands = <String, Command>{};
  final _subscriptions = <String, PubSub>{};

  PubSubServiceImpl(this._appConfig);

  Future<Command> _createCommand() async {
    final connection = RedisConnection();
    final redisHost = _appConfig.redisHost;
    final redisPort = _appConfig.redisPort;
    final command = await connection.connect(redisHost, redisPort);

    final redisUser = _appConfig.redisUser;
    final redisPassword = _appConfig.redisPassword;
    await command.send_object(['AUTH', redisUser, redisPassword]);

    return command;
  }

  Future<Command> _getOrCreatePubCommand(String channelId) async {
    if (!_pubCommands.containsKey(channelId)) {
      _pubCommands[channelId] = await _createCommand();
    }
    return _pubCommands[channelId]!;
  }

  Future<Command> _getOrCreateSubCommand(String channelId) async {
    if (!_subCommands.containsKey(channelId)) {
      _subCommands[channelId] = await _createCommand();
    }
    return _subCommands[channelId]!;
  }

  @override
  Future<void> subscribeToChannel({
    required String channelId,
    required Function(dynamic)? onMessage,
  }) async {
    if (_subscriptions.containsKey(channelId)) return;

    final command = await _getOrCreateSubCommand(channelId);
    final sub = PubSub(command);
    _subscriptions[channelId] = sub;

    sub.subscribe([channelId]);

    final stream = sub.getStream();
    stream.listen(
      onMessage,
      cancelOnError: false,
      onDone: () => log('Redis [$channelId] Stream closed'),
      onError: (e) => log('Redis [$channelId] stream exception: $e'),
    );
  }

  @override
  Future<void> unsubscribeFromChannel({
    required String channelId,
  }) async {
    if (_subscriptions.containsKey(channelId)) {
      final sub = _subscriptions[channelId];
      sub?.unsubscribe([channelId]);

      _subscriptions.remove(channelId);
      _subCommands.remove(channelId);
    }
  }

  @override
  Future<void> publishToChannel({
    required String channelId,
    required String message,
  }) async {
    final command = await _getOrCreatePubCommand(channelId);
    final result = await command.send_object(['PUBLISH', channelId, message]);
    return result;
  }
}
