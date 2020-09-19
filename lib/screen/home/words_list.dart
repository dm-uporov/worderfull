import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:words_remember/business/WordsRepository.dart';
import 'package:words_remember/model/Word.dart';

class WordsListScreen extends StatefulWidget {
  const WordsListScreen({Key key}) : super(key: key);
  @override
  _WordsListScreenState createState() => _WordsListScreenState();
}

class _WordsListScreenState extends State<WordsListScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: WordsRepository.wordsListenable(),
      builder: (context, Box<Word> box, widget) {
        return ListView(
          children: box.values.map(_wordToWidget).toList(),
        );
      },
    );
  }

  Widget _wordToWidget(Word word) {
    return ListTile(
      title: Text(word.source),
      subtitle: Text(word.translate),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            word.delete();
          });
        },
      ),
    );
  }
}