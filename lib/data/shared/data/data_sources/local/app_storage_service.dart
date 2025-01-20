abstract class AppStorageService {
  Future<void> setLocale(String locale);
  String? getLocale();
  Future<void> clearLocale();

  Future<void> setAccessToken(String token);
  String? getAccessToken();
}
