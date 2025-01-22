abstract class AppStorageService {
  Future<void> setLocale(String locale);
  Future<String?> getLocale();
  Future<void> clearLocale();
}
