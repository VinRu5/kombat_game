import 'package:flutter/material.dart';
import 'package:kombat_game/components/challenging_characters.dart';
import 'package:kombat_game/components/sentences.dart';
import 'package:kombat_game/functions/character.dart';
import 'package:kombat_game/functions/sentence.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int countTurn = 0;
  Character userCharacter = Warrior(
      'Spiderman', 25, 15, 'assets/images/cavaliere_2.png', 'Ragnatela');

  Character challangerCharacter = Archer(
      'Atinius', 22, 10, 'assets/images/arciere_1.png', 'Freccie circolari');

  List<Sentence> userSentences = [];
  List<Sentence> challangerSentences = [];

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

    setState(() {
      countTurn += 1;
      userSentences.add(Sentence(
        text: striker == userCharacter
            ? userCharacter.attacks()
            : userCharacter.defend(),
        action: striker == userCharacter
            ? Icons.swap_horiz
            : Icons.health_and_safety,
        color: Colors.blue,
      ));
      challangerSentences.add(Sentence(
        text: striker == challangerCharacter
            ? challangerCharacter.attacks()
            : challangerCharacter.defend(),
        action: striker == challangerCharacter
            ? Icons.swap_horiz
            : Icons.health_and_safety,
        color: Colors.red,
      ));
    });
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
          child: ElevatedButton(
            onPressed:
                userCharacter.health <= 0 || challangerCharacter.health <= 0
                    ? null
                    : nextTurn,
            child: Text('Avvia il prossimo turno'),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        ChallengingCharacters(
          userCharacter: userCharacter,
          challangerCharacter: challangerCharacter,
        ),
        Sentences(
          userSentences: userSentences,
          challangerSentences: challangerSentences,
        ),
      ],
    );
  }
}
