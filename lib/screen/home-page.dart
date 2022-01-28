import 'package:flutter/material.dart';
import 'package:kombat_game/models/character.dart';
import 'package:kombat_game/screen/choice-character.dart';
import 'package:kombat_game/screen/game.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool userChoose = false;
  late Character userCharacter;
  late Character challangerCharacter;
  late List<Character> teams;

  @override
  void initState() {
    teams = setTeams;

    super.initState();
  }

  void restartApplication() {
    teams.forEach((character) => character.health = 100);

    //print(teamBlue);
    setState(() {
      userChoose = false;
    });
  }

  void choicedThis(Character character) {
    List<Character> challangerTeam = setTeamBlue;

    if (character.team == Team.blue) {
      challangerTeam = setTeamRed;
    }

    Character challanger = challangerTeam[randomNum(challangerTeam.length)];

    setState(() {
      userChoose = true;
      userCharacter = character;
      challangerCharacter = challanger;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kombat Game'),
        centerTitle: true,
        backgroundColor: Colors.amber.shade700,
      ),
      body: userChoose
          ? Game(
              userCharacter: userCharacter,
              challangerCharacter: challangerCharacter,
              restartApplication: restartApplication,
            )
          : ChoiceCharacter(
              choicedThis: (character) => choicedThis(character),
              teams: teams,
            ),
    );
  }
}
