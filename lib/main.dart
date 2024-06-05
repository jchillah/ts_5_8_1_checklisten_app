import 'package:flutter/material.dart';
import 'package:ts_5_8_1_checklisten_app/src/app.dart';
import 'package:ts_5_8_1_checklisten_app/src/data/database_repository.dart';
import 'package:ts_5_8_1_checklisten_app/src/data/mock_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DatabaseRepository databaseRepository = MockDatabase();

  runApp(App(databaseRepository: databaseRepository));
}
