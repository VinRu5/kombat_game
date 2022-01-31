import 'package:flutter/material.dart';
import 'package:kombat_game/models/character.dart';

/// gestisce la grafica della card che racchiude il personaggio
class CharacterCard extends StatelessWidget {
  final Character character;
  final String color;
  final void Function() onTap;
  const CharacterCard({
    required this.character,
    required this.color,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
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
