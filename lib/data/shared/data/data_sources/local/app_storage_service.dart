abstract class AppStorageService {
  Future<void> setLocale(String locale);
  String? getLocale();
  Future<void> clearLocale();
}
