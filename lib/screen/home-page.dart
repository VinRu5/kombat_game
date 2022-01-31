import 'package:flutter/material.dart';
import 'package:kombat_game/models/character.dart';
import 'package:kombat_game/screen/choice-character.dart';
import 'package:kombat_game/screen/create_character.dart';
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
    //teams.forEach((character) => character.health = 100);
    for (var character in teams) {
      character.health = 100;
    }

    //print(teamBlue);
    setState(() {
      userChoose = false;
    });
  }

  void choicedThis(Character character) {
    List<Character> challangerTeam = getTeamBlue().toList();

    if (character.team == Team.blue) {
      challangerTeam = getTeamRed().toList();
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kombat Game'),
          centerTitle: true,
          backgroundColor: Colors.amber.shade700,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Icon(Icons.sports_esports),
              Icon(Icons.add_circle),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            viewUserChoose(),
            CreateCharacter(),
          ],
        ),
      ),
    );
  }

  Widget viewUserChoose() => userChoose
      ? Game(
          userCharacter: userCharacter,
          challangerCharacter: challangerCharacter,
          restartApplication: restartApplication,
        )
      : ChoiceCharacter(
          choicedThis: (character) => choicedThis(character),
          teams: teams,
        );
}
