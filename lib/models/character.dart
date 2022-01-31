import 'dart:math';

enum Team { blue, red }

//creo una classe astratta per tutti i personaggi
abstract class Character {
  //tutti i personaggi avranno almeno un nome ed una linea salute
  final String name;
  int health = 100;
  final int attackPower;
  final int defensePower;
  final String profileImage;
  final Team team;
  final Photo valuePhoto;

  //constructor per la classe
  Character(this.name, this.attackPower, this.defensePower, this.profileImage,
      this.team, this.valuePhoto);

  //function comuni
  String attacks();
  String defend();
  String superPower();
}

//genero la classe Warrior
class Warrior extends Character {
  final String hisSuperPower;

  Warrior(
    String name,
    int attackPower,
    int defensePower,
    String profileImage,
    Team team,
    Photo valuePhoto,
    this.hisSuperPower,
  ) : super(name, attackPower, defensePower, profileImage, team, valuePhoto);

  @override
  String attacks() => 'Attacco con i miei fortissimi pugni';

  @override
  String defend() => 'I miei Muscoli possono difendermi da tutto';

  @override
  String superPower() => 'Scateno il mio superpotere: $hisSuperPower';

  @override
  String toString() => '''
  name: $name
  health: $health
  ''';
}

//genero la classe Archer
class Archer extends Character {
  final String hisSuperPower;

  Archer(
    String name,
    int attackPower,
    int defensePower,
    String profileImage,
    Team team,
    Photo valuePhoto,
    this.hisSuperPower,
  ) : super(
          name,
          attackPower,
          defensePower,
          profileImage,
          team,
          valuePhoto,
        );

  @override
  String attacks() => 'Le mie freccie colpiscono tutte al cuore';

  @override
  String defend() =>
      'Sotto il mio mantello sarò invisibile a tutti gli attacchi';

  @override
  String superPower() => 'Scateno il mio superpotere: $hisSuperPower';

  @override
  String toString() => '''
  name: $name
  health: $health
  ''';
}

//genero la classe Knight
class Knight extends Character {
  final String hisSuperPower;

  Knight(
    String name,
    int attackPower,
    int defensePower,
    String profileImage,
    Team team,
    Photo valuePhoto,
    this.hisSuperPower,
  ) : super(
          name,
          attackPower,
          defensePower,
          profileImage,
          team,
          valuePhoto,
        );

  @override
  String attacks() => 'Con lancia o spada ti travolgerò';

  @override
  String defend() => 'Il mio scudo può bloccare di tutto';

  @override
  String superPower() => 'Scateno il mio superpotere: $hisSuperPower';

  @override
  String toString() => '''
  name: $name
  health: $health
  ''';
}

class PhotoCharacter {
  String asset;
  Photo value;
  Team team;

  PhotoCharacter(
    this.asset,
    this.team,
    this.value,
  );
}

//funzione per generare numero random
int randomNum(int max) {
  var random = Random();

  return random.nextInt(max);
}

final setTeams = [
  Warrior(
    'Spiderman',
    25,
    15,
    'assets/images/cavaliere_2.png',
    Team.blue,
    Photo.warriorBlue,
    'Ragnatela',
  ),
  Archer(
    'Legolas',
    18,
    10,
    'assets/images/arciere_2.png',
    Team.blue,
    Photo.archerBlue,
    'Tre freccie',
  ),
  Knight(
    'Warm',
    27,
    20,
    'assets/images/cavaliere_2_1.png',
    Team.blue,
    Photo.knigthBlue,
    'Carica superiore',
  ),
  Warrior(
    'He-Man',
    17,
    15,
    'assets/images/cavaliere_1.png',
    Team.red,
    Photo.warriorRed,
    'Graffio profondo',
  ),
  Archer(
    'Atinius',
    22,
    10,
    'assets/images/arciere_1.png',
    Team.red,
    Photo.archerRed,
    'Freccie circolari',
  ),
  Knight(
    'Mah',
    25,
    20,
    'assets/images/cavaliere_1_1.png',
    Team.red,
    Photo.knigthRed,
    'Carica superiore',
  ),
];

final viewRadio = [
  PhotoCharacter(
    'assets/images/cavaliere_2.png',
    Team.blue,
    Photo.warriorBlue,
  ),
  PhotoCharacter(
    'assets/images/arciere_2.png',
    Team.blue,
    Photo.archerBlue,
  ),
  PhotoCharacter(
    'assets/images/cavaliere_2_1.png',
    Team.blue,
    Photo.knigthBlue,
  ),
  PhotoCharacter(
    'assets/images/cavaliere_1.png',
    Team.red,
    Photo.warriorRed,
  ),
  PhotoCharacter(
    'assets/images/arciere_1.png',
    Team.red,
    Photo.archerRed,
  ),
  PhotoCharacter(
    'assets/images/cavaliere_1_1.png',
    Team.red,
    Photo.knigthRed,
  ),
];

Iterable<Character> getTeamBlue() sync* {
  for (final character in setTeams) {
    if (character.team == Team.blue) {
      yield character;
    }
  }
}

Iterable<Character> getTeamRed() sync* {
  for (final character in setTeams) {
    if (character.team == Team.red) {
      yield character;
    }
  }
}

enum Photo {
  warriorBlue,
  warriorRed,
  archerBlue,
  archerRed,
  knigthBlue,
  knigthRed,
}
