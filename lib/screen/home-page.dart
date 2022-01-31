import 'package:flutter/material.dart';
import 'package:kombat_game/models/character.dart';
import 'package:kombat_game/screen/choice-character.dart';
import 'package:kombat_game/screen/create_character.dart';
import 'package:kombat_game/screen/game.dart';

/// classe che gestisce l'home page dell'app e tutto il suo stato
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// gestisce la visualizzazione della pagina corrente
  bool userChoose = false;

  /// personaggio scelto dall'utente
  late Character userCharacter;

  /// personaggio sfidante
  late Character challangerCharacter;

  /// contiene tutti i personaggi
  late List<Character> teams;

  /// al caricamento della pagina prendo il mio array di riferimento
  @override
  void initState() {
    teams = setTeams;

    super.initState();
  }

  /// funzione per resettare la vita dei personaggi a fine duello e ricominciare a giocare
  void restartApplication() {
    //teams.forEach((character) => character.health = 100);
    for (var character in teams) {
      character.health = 100;
    }

    setState(() {
      userChoose = false;
    });
  }

  /// gestisce la scelta dell'utente e l'estrazione dello sfidante
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

          /// tab bar che gestisce la pagina game e la pagina creazione
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

  /// sceglie la vista nell'app
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
