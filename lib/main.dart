import 'package:flutter/material.dart';
import 'package:ts_5_8_1_checklisten_app/src/app.dart';
import 'package:ts_5_8_1_checklisten_app/src/data/database_repository.dart';
import 'package:ts_5_8_1_checklisten_app/src/data/shared_preferences_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DatabaseRepository databaseRepository = SharedPreferencesDatabase();

  runApp(App(databaseRepository: databaseRepository));
}
