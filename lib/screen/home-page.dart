import 'package:flutter/material.dart';
import 'package:kombat_game/screen/choice-character.dart';
import 'package:kombat_game/screen/game.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool userChose = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kombat Game'),
        centerTitle: true,
        backgroundColor: Colors.amber.shade700,
      ),
      body: userChose ? Game() : ChoiceCharacter(),
    );
  }
}
