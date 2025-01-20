abstract class AppRepository {
  String? getSelectedLocale();
  Future<void> saveSelectedLocale(String locale);
  Future<void> clearSelectedLocale();
}
