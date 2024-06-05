import 'package:flutter/material.dart';
import 'package:ts_5_8_1_checklisten_app/src/data/database_repository.dart';

class TextGridScreen extends StatefulWidget {
  final DatabaseRepository databaseRepository;

  const TextGridScreen({super.key, required this.databaseRepository});

  @override
  _TextListScreenState createState() => _TextListScreenState();
}

class _TextListScreenState extends State<TextGridScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _textList = [];

  @override
  void initState() {
    super.initState();
    _loadStoredText();
  }

  Future<void> _loadStoredText() async {
    String? storedText = await widget.databaseRepository.getStoredText();
    if (storedText != null) {
      setState(() {
        _textList.add(storedText);
      });
    }
  }

  void _addTextToList() async {
    if (_textController.text.isNotEmpty) {
      await widget.databaseRepository.storeText(_textController.text);
      setState(() {
        _textList.add(_textController.text);
        _textController.clear();
      });
    }
  }

  void _removeTextFromList(int index) async {
    await widget.databaseRepository.deleteStoredText();
    setState(() {
      _textList.remove;
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
              child: FutureBuilder(
                future: widget.databaseRepository.getStoredText(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error loading data'));
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:
                            3, // Adjust the aspect ratio as needed
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: _textList.length,
                      itemBuilder: (context, index) {
                        return GridTile(
                          footer: GridTileBar(
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                              onPressed: () => _removeTextFromList(index),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(_textList[index]),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
