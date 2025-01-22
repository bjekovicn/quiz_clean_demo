abstract class KeyValueStorage<T> {
  Future<void> put(String key, T value);
  Future<T?> get(String key);
  Future<void> delete(String key);
  Future<void> clear();
}
