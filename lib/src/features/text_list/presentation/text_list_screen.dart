import 'package:flutter/material.dart';
import 'package:ts_5_8_1_checklisten_app/src/data/database_repository.dart';

class TextListScreen extends StatefulWidget {
  final DatabaseRepository databaseRepository;

  const TextListScreen({super.key, required this.databaseRepository});

  @override
  _TextListScreenState createState() => _TextListScreenState();
}

class _TextListScreenState extends State<TextListScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
