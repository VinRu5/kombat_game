import 'package:flutter/material.dart';
import 'package:kombat_game/functions/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final String color;
  const CharacterCard({
    required this.character,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        splashColor: colorTeam(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                character.profileImage,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
              Text(character.name),
              Text('Attacco: ${character.attackPower}'),
              Text('Difesa: ${character.defensePower}'),
              Text(character.health.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Color colorTeam() {
    switch (color.toLowerCase()) {
      case 'blue':
        return Colors.blue.shade200;
      case 'red':
        return Colors.red.shade200;
      default:
        return Colors.amber.shade200;
    }
  }
}
