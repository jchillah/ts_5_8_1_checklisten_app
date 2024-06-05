import 'package:flutter/material.dart';
import 'package:ts_5_8_1_checklisten_app/src/data/database_repository.dart';
import 'package:ts_5_8_1_checklisten_app/src/data/mock_database.dart';

class TextListScreen extends StatefulWidget {
  const TextListScreen(
      {super.key, required DatabaseRepository databaseRepository});

  @override
  _TextListScreenState createState() => _TextListScreenState();
}

class _TextListScreenState extends State<TextListScreen> {
  final TextEditingController _textController = TextEditingController();
  final MockDatabase _database = MockDatabase();
  final List<String> _textList = [];

  @override
  void initState() {
    super.initState();
    _loadStoredText();
  }

  void _loadStoredText() {
    String? storedText = _database.getStoredText();
    if (storedText != null) {
      setState(() {
        _textList.add(storedText);
      });
    }
  }

  void _addTextToList() {
    if (_textController.text.isNotEmpty) {
      _database.storeText(_textController.text);
      setState(() {
        _textList.add(_textController.text);
        _textController.clear();
      });
    }
  }

  void _removeTextFromList(int index) {
    _database.deleteStoredText();
    setState(() {
      _textList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text List App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Enter text',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addTextToList,
              child: const Text('Add to List'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _textList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_textList[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _removeTextFromList(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
