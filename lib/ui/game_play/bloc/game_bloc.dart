import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '/core/error_handling/failure.dart';
import '/ui/game_play/bloc/game_states.dart';
import '/ui/game_play/bloc/game_events.dart';
import '/data/game/domain/init_game_entity.dart';
import '/data/game/domain/repositories/game_repository.dart';

@Injectable()
class GameBloc extends Bloc<GameEvent, GameState> {
  //
  final InitGameEntity _initData;
  final GameRepository _gameRepository;

  //
  String get userId => _initData.userId;
  String get languageCode => _initData.languageCode;

  GameBloc(
    @factoryParam this._initData,
    @factoryParam this._gameRepository,
  ) : super(GameInitial()) {
    //REDIS CHANNEL EVENTS
    on<SubscribeToUserChannelEvent>(_onSubscribeToUserChannel);
    on<UnsubscribeFromUserChannelEvent>(_onUnsubscribeFromUserChannel);
    on<JoinToMatchMakingQueueEvent>(_onJoinToMatchMakingQueue);
    //GAME EVENTS
    on<GameStartEvent>(_onGameStart);
    on<RoundStartEvent>(_onRoundStart);
    on<RoundAnswerEvent>(_onRoundAnswer);
    on<RoundEndEvent>(_onRoundEnd);
    on<GameEndEvent>(_onGameEnd);
  }

  Future<void> _onSubscribeToUserChannel(
    SubscribeToUserChannelEvent event,
    Emitter<GameState> emit,
  ) async {
    final res = await _gameRepository.subscribeToUserChannel(
      userId: _initData.userId,
      onGameStart: (gameStartEntity) => add(
        GameStartEvent(gameStartEntity),
      ),
    );
    res.fold(
      (Failure failure) => log('[USER: $userId] SUB ERR: $failure!'),
      (void _) => log('[USER: $userId] SUB DONE!'),
    );
  }

  Future<void> _onUnsubscribeFromUserChannel(
    UnsubscribeFromUserChannelEvent event,
    Emitter<GameState> emit,
  ) async {
    await _gameRepository.unsubscribeFromChannel(channelId: userId);
  }

  Future<void> _onJoinToMatchMakingQueue(
    JoinToMatchMakingQueueEvent event,
    Emitter<GameState> emit,
  ) async {
    await _gameRepository.publishToChannel(
      channelId: userId,
      message: json.encode({'id': userId, 'ln': languageCode}),
    );
  }

  Future<void> _onGameStart(
    GameStartEvent event,
    Emitter<GameState> emit,
  ) async {
    final roomId = event.gameStartEntity.roomId;
    final res = await _gameRepository.subscribeToGameRoomChannel(
      roomId: roomId,
      onRoundStart: (roundStartEntity) => add(
        RoundStartEvent(roundStartEntity),
      ),
      onRoundEnd: (roundEndEntity) => add(
        RoundEndEvent(roundEndEntity),
      ),
      onGameEnd: (gameEndEntity) => add(
        GameEndEvent(gameEndEntity),
      ),
    );

    res.fold(
      (Failure failure) => log('[ROOM: $roomId] SUB ERR: $failure!'),
      (void _) => emit(GameStartState(event.gameStartEntity)),
    );
  }

  void _onRoundStart(RoundStartEvent event, Emitter<GameState> emit) {
    if (state is GameStartState) {
      final gameStartState = state as GameStartState;
      emit(RoundStartState(
        event.roundStartEntity,
        gameStartState.gameStartEntity,
      ));
    }

    if (state is RoundEndState) {
      final roundEndState = state as RoundEndState;
      emit(RoundStartState(
        event.roundStartEntity,
        roundEndState.gameStartEntity,
      ));
    }
  }

  void _onRoundEnd(RoundEndEvent event, Emitter<GameState> emit) {
    if (state is RoundStartState) {
      final roundStartState = state as RoundStartState;
      emit(RoundEndState(
        event.roundEndEntity,
        roundStartState.gameStartEntity,
      ));
    }

    if (state is RoundAnswerState) {
      final roundAnswerState = state as RoundAnswerState;
      emit(RoundEndState(
        event.roundEndEntity,
        roundAnswerState.gameStartEntity,
      ));
    }
  }

  void _onGameEnd(GameEndEvent event, Emitter<GameState> emit) {
    if (state is RoundEndState) {
      final roundEndState = state as RoundEndState;
      emit(GameEndState(
        event.gameEndEntity,
        roundEndState.gameStartEntity,
      ));
    }

    if (state is RoundAnswerState) {
      final roundAnswerState = state as RoundAnswerState;
      emit(GameEndState(
        event.gameEndEntity,
        roundAnswerState.gameStartEntity,
      ));
    }
  }

  Future<void> _onRoundAnswer(
    RoundAnswerEvent event,
    Emitter<GameState> emit,
  ) async {
    if (state is! RoundStartState) return;

    final roundStartState = state as RoundStartState;
    await _gameRepository.publishToChannel(
      channelId: roundStartState.gameStartEntity.roomId,
      message: json.encode({
        't': 'RA',
        'd': {'an': event.answer, 'id': userId}
      }),
    );

    emit(RoundAnswerState(
      event.answer,
      roundStartState.gameStartEntity,
    ));
  }
}
