abstract class AppRepository {
  Future<String?> getSelectedLocale();
  Future<void> saveSelectedLocale(String locale);
  Future<void> clearSelectedLocale();
}
