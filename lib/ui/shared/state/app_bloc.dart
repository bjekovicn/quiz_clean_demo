import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '/core/l10n/l10n.dart';
import '/ui/shared/state/app_event.dart';
import '/ui/shared/state/app_state.dart';
import '/data/shared/domain/repositories/app_repository.dart';

@injectable
class AppBloc extends Bloc<AppEvent, AppState> {
  final AppRepository _repository;

  AppBloc(
    this._repository,
  ) : super(const AppInitState(L10n.locale)) {
    on<AppEventChangeLocale>(_onLocaleChanged);
    on<AppEventLoadLanguageCode>(_onLoadLanguageCode);
  }

  void _onLocaleChanged(
    AppEventChangeLocale event,
    Emitter<AppState> emit,
  ) {
    _repository.saveSelectedLocale(event.locale.languageCode);
    emit(AppLocaleChangedState(event.locale));
  }

  void _onLoadLanguageCode(
    AppEventLoadLanguageCode event,
    Emitter<AppState> emit,
  ) async {
    final languageCode = _repository.getSelectedLocale();
    final locale = L10n.getLocaleByLanguageCode(
      languageCode ?? L10n.locale.languageCode,
    );
    emit(AppLocaleLoadedState(locale));
  }
}
