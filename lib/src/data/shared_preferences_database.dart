import 'package:shared_preferences/shared_preferences.dart';
import 'package:ts_5_8_1_checklisten_app/src/data/database_repository.dart';

class SharedPreferencesDatabase implements DatabaseRepository {
  static const String storedTextKey = 'textList';

  @override
  Future<void> storeText(String input) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> textList = prefs.getStringList(storedTextKey) ?? [];
    textList.add(input);
    await prefs.setStringList(storedTextKey, textList);
  }

  @override
  Future<void> deleteStoredText() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(storedTextKey);
  }

  @override
  Future<String?> getStoredText() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(storedTextKey)?.join('\n');
  }
}
