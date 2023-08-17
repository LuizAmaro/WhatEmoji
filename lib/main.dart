import 'package:flutter/material.dart';

void main() => runApp(WhatEmojiApp());

class WhatEmojiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatEmoji',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmojiHomePage(),
    );
  }
}

class EmojiHomePage extends StatefulWidget {
  @override
  _EmojiHomePageState createState() => _EmojiHomePageState();
}

class _EmojiHomePageState extends State<EmojiHomePage> {
  final TextEditingController _contextController = TextEditingController();
  final TextEditingController _emojiController = TextEditingController();
  final List<String> listEmoji = ["😀", "😃", "😄"]; // Aqui você pode adicionar mais emojis conforme necessário

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatEmoji'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _contextController,
                maxLines: null,
                decoration: InputDecoration(labelText: "Digite o contexto"),
                onChanged: (text) {
                  // Chamar a função para exibir emojis filtrados
                  _showEmojiDialog(text);
                },
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: TextField(
                controller: _emojiController,
                maxLines: null,
                decoration: InputDecoration(labelText: "Emojis selecionados"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showEmojiDialog(String text) {
    // Aqui você pode adicionar a lógica para filtrar emojis com base no texto
    // Por enquanto, apenas mostraremos todos os emojis da listEmoji

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecionar Emoji'),
          content: SingleChildScrollView(
            child: ListBody(
              children: listEmoji.map((emoji) {
                return GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(emoji, style: TextStyle(fontSize: 24)),
                  ),
                  onTap: () {
                    _emojiController.text += emoji;
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
