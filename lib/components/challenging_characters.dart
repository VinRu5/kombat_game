import 'package:flutter/material.dart';
import 'package:kombat_game/components/challanger_card.dart';
import 'package:kombat_game/models/character.dart';

/// classe che renderizzza graficamente i due sfidante nel duello
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
        ChallangerCard(
          character: userCharacter,
          color: 'blue',
        ),
        ChallangerCard(
          character: challangerCharacter,
          color: 'red',
        ),
      ],
    );
  }
}
