import 'package:flutter/material.dart';
import 'package:kombat_game/functions/character.dart';
import 'package:kombat_game/components/character_card.dart';

class ChallengingCharacters extends StatelessWidget {
  final Character userCharacter;
  final Character challangerCharacter;

  const ChallengingCharacters({
    required this.userCharacter,
    required this.challangerCharacter,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CharacterCard(
          character: userCharacter,
          color: 'blue',
        ),
        CharacterCard(
          character: challangerCharacter,
          color: 'red',
        ),
      ],
    );
  }
}
