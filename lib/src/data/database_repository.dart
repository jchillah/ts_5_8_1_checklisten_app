abstract class DatabaseRepository {
  void storeText(String input);

  String? getStoredText();

  void deleteStoredText();
}
