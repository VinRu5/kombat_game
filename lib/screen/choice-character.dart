import 'package:flutter/material.dart';
import 'package:kombat_game/components/jumbotron.dart';
import 'package:kombat_game/components/subtitle.dart';
import 'package:kombat_game/components/teams.dart';
import 'package:kombat_game/components/title-game.dart';
import 'package:kombat_game/components/title-team.dart';
import 'package:kombat_game/models/character.dart';

/// classe per gestire la scelta del personaggio
class ChoiceCharacter extends StatelessWidget {
  void Function(Character character) choicedThis;
  final List<Character> teams;
  ChoiceCharacter({
    required this.choicedThis,
    required this.teams,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(32),
      children: <Widget>[
        const TitleGame('kombat game'),
        const Jumbotron('assets/images/castello.png'),
        const Subtitle('Scegli la tua squadra:'),
        const TitleTeam(),
        Teams(
          choicedThis: (character) => choicedThis(character),
          teams: teams,
        ),
      ],
    );
  }
}
