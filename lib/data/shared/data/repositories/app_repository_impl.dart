import '/data/shared/domain/repositories/app_repository.dart';
import '/data/shared/data/data_sources/local/app_storage_service.dart';

class AppRepositoryImpl implements AppRepository {
  final AppStorageService _appStorageService;

  AppRepositoryImpl(this._appStorageService);
  @override
  Future<void> clearSelectedLocale() async {
    await _appStorageService.clearLocale();
  }

  @override
  String? getSelectedLocale() {
    return _appStorageService.getLocale();
  }

  @override
  Future<void> saveSelectedLocale(String locale) async {
    await _appStorageService.setLocale(locale);
  }
}
