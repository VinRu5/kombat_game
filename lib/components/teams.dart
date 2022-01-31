import 'package:flutter/material.dart';
import 'package:kombat_game/components/character_card.dart';
import 'package:kombat_game/models/character.dart';

/// gestisce i teams
class Teams extends StatelessWidget {
  void Function(Character character) choicedThis;
  final List<Character> teams;

  Teams({
    required this.choicedThis,
    required this.teams,
    Key? key,
  }) : super(key: key);

  /// visualizza un Dialog quando il personaggio è scelto
  void advertisingToChoose(context, character) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Hai scelto ${character.name}. Vuoi continuare?'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              choicedThis(character);
            },
            child: Text('SI'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('NO'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: getTeamBlue()
              .map((character) => CharacterCard(
                    character: character,
                    color: 'blue',
                    onTap: () => advertisingToChoose(context, character),
                  ))
              .toList(),
        ),
        Column(
          children: getTeamRed()
              .map((character) => CharacterCard(
                    character: character,
                    color: 'red',
                    onTap: () => advertisingToChoose(context, character),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
