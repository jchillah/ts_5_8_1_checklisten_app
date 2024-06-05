import 'package:ts_5_8_1_checklisten_app/src/data/database_repository.dart';

class MockDatabase implements DatabaseRepository {
  String? _storedText;

  @override
  String? getStoredText() {
    return _storedText;
  }

  @override
  void storeText(String input) {
    _storedText = input;
  }

  @override
  void deleteStoredText() {
    _storedText = null;
  }
}
