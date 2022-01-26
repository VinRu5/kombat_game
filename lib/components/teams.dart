import 'package:flutter/material.dart';
import 'package:kombat_game/components/character_card.dart';
import 'package:kombat_game/functions/character.dart';

class Teams extends StatelessWidget {
  final teamBlue = [
    Warrior('Spiderman', 25, 15, 'assets/images/cavaliere_2.png', 'Ragnatela'),
    Archer('Legolas', 18, 10, 'assets/images/arciere_2.png', 'Tre freccie'),
    Knight(
        'Warm', 27, 20, 'assets/images/cavaliere_2_1.png', 'Carica superiore'),
  ];

//istanzio il team red
  final teamRed = [
    Warrior(
        'He-Man', 17, 15, 'assets/images/cavaliere_1.png', 'Graffio profondo'),
    Archer(
        'Atinius', 22, 10, 'assets/images/arciere_1.png', 'Freccie circolari'),
    Knight(
        'Mah', 25, 20, 'assets/images/cavaliere_1_1.png', 'Carica superiore'),
  ];

  Teams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: teamBlue
              .map((character) => CharacterCard(
                    character: character,
                    color: 'blue',
                  ))
              .toList(),
        ),
        Column(
          children: teamRed
              .map((character) => CharacterCard(
                    character: character,
                    color: 'red',
                  ))
              .toList(),
        ),
      ],
    );
  }
}
