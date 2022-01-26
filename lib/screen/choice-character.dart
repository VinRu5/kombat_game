import 'package:flutter/material.dart';
import 'package:kombat_game/components/jumbotron.dart';
import 'package:kombat_game/components/subtitle.dart';
import 'package:kombat_game/components/teams.dart';
import 'package:kombat_game/components/title-game.dart';
import 'package:kombat_game/components/title-team.dart';

class ChoiceCharacter extends StatelessWidget {
  const ChoiceCharacter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(32),
      children: <Widget>[
        const TitleGame('kombat game'),
        const Jumbotron('assets/images/castello.png'),
        const Subtitle('Scegli la tua squadra:'),
        const TitleTeam(),
        Teams(),
      ],
    );
  }
}
