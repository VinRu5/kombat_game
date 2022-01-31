import 'package:flutter/material.dart';
import 'package:kombat_game/components/challenging_characters.dart';
import 'package:kombat_game/components/sentences_turn.dart';
import 'package:kombat_game/models/character.dart';
import 'package:kombat_game/models/sentence.dart';

/// classe che gestisce il gioco e tutta la sua logica
class Game extends StatefulWidget {
  late Character userCharacter;
  late Character challangerCharacter;
  void Function() restartApplication;
  Game({
    required this.userCharacter,
    required this.challangerCharacter,
    required this.restartApplication,
    Key? key,
  }) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  /// variabile per tenere il conteggio del turno
  int countTurn = 0;

  late Character userCharacter;
  late Character challangerCharacter;

  /// array che raccoglie le frasi dei personaggi durante il duello
  List<SentenceTurn> sentences = [];

  /// gestisce il turno di gioco
  nextTurn() {
    Character striker;

    Character defender;

    if (countTurn % 2 == 0) {
      striker = userCharacter;
      defender = challangerCharacter;
    } else {
      striker = challangerCharacter;
      defender = userCharacter;
    }
    int amountAttack = (striker.attackPower - defender.defensePower);

    if (amountAttack > 0) {
      defender.health -= amountAttack;
    }

    SentenceTurn turn = SentenceTurn(
      turn: (countTurn + 1),
      userSentence: Sentence(
        text: striker == userCharacter
            ? userCharacter.attacks()
            : userCharacter.defend(),
        action: striker == userCharacter
            ? Icons.swap_horiz
            : Icons.health_and_safety,
        color: Colors.blue,
      ),
      challangerSentence: Sentence(
        text: striker == challangerCharacter
            ? challangerCharacter.attacks()
            : challangerCharacter.defend(),
        action: striker == challangerCharacter
            ? Icons.swap_horiz
            : Icons.health_and_safety,
        color: Colors.red,
      ),
    );

    if (defender.health <= 0) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('${striker.name} ha vinto'),
          actions: [
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.amber.shade700),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  widget.restartApplication();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.restart_alt),
                    Text('Ricomincia'),
                  ],
                ))
          ],
        ),
      );
    }

    setState(() {
      countTurn += 1;
      sentences = [turn, ...sentences];
    });
  }

  @override
  void initState() {
    userCharacter = widget.userCharacter;
    challangerCharacter = widget.challangerCharacter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            'Turno $countTurn',
            style: TextStyle(
              fontSize: 30,
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed:
                    userCharacter.health <= 0 || challangerCharacter.health <= 0
                        ? null
                        : nextTurn,
                child: Text('Avvia il prossimo turno'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber.shade700),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => widget.restartApplication(),
                child: Icon(Icons.restart_alt),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber.shade700),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        ChallengingCharacters(
          userCharacter: userCharacter,
          challangerCharacter: challangerCharacter,
        ),
        SentencesTurn(
          sentences: sentences,
        ),
      ],
    );
  }
}
