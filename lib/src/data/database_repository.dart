abstract class DatabaseRepository {
  Future<void> storeText(String input);

  Future<String?> getStoredText();

  Future<void> deleteStoredText();
}
