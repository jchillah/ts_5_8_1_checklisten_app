import 'package:ts_5_8_1_checklisten_app/src/data/database_repository.dart';

class MockDatabase implements DatabaseRepository {
  String? _storedText;

  @override
  Future<String?> getStoredText() async {
    await Future.delayed(const Duration(seconds: 2));
    return _storedText;
  }

  @override
  Future<void> storeText(String input) async {
    await Future.delayed(const Duration(seconds: 2));
    _storedText = input;
  }

  @override
  Future<void> deleteStoredText() async {
    await Future.delayed(const Duration(seconds: 2));
    _storedText = null;
  }
}
