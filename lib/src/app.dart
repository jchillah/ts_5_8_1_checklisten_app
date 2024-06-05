import 'package:flutter/material.dart';
import 'package:ts_5_8_1_checklisten_app/src/data/database_repository.dart';
import 'package:ts_5_8_1_checklisten_app/src/features/text_list/presentation/text_list_screen.dart';

class App extends StatelessWidget {
  final DatabaseRepository databaseRepository;

  const App({
    super.key,
    required this.databaseRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: TextListScreen(
      databaseRepository: databaseRepository,
    ));
  }
}
