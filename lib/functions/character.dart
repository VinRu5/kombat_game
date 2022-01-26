import 'dart:math';

//creo una classe astratta per tutti i personaggi
abstract class Character {
  //tutti i personaggi avranno almeno un nome ed una linea salute
  final String name;
  int health = 100;
  final int attackPower;
  final int defensePower;
  final String profileImage;

  //constructor per la classe
  Character(this.name, this.attackPower, this.defensePower, this.profileImage);

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
    this.hisSuperPower,
  ) : super(name, attackPower, defensePower, profileImage);

  @override
  String attacks() => 'Attacco con i miei fortissimi pugni';

  @override
  String defend() => 'I miei Muscoli possono difendermi da tutto';

  @override
  String superPower() => 'Scateno il mio superpotere: $hisSuperPower';
}

//genero la classe Archer
class Archer extends Character {
  final String hisSuperPower;

  Archer(
    String name,
    int attackPower,
    int defensePower,
    String profileImage,
    this.hisSuperPower,
  ) : super(name, attackPower, defensePower, profileImage);

  @override
  String attacks() => 'Le mie freccie colpiscono tutte al cuore';

  @override
  String defend() =>
      'Sotto il mio mantello sarò invisibile a tutti gli attacchi';

  @override
  String superPower() => 'Scateno il mio superpotere: $hisSuperPower';
}

//genero la classe Knight
class Knight extends Character {
  final String hisSuperPower;

  Knight(
    String name,
    int attackPower,
    int defensePower,
    String profileImage,
    this.hisSuperPower,
  ) : super(name, attackPower, defensePower, profileImage);

  @override
  String attacks() => 'Con lancia o spada ti travolgerò';

  @override
  String defend() => 'Il mio scudo può bloccare di tutto';

  @override
  String superPower() => 'Scateno il mio superpotere: $hisSuperPower';
}

//funzione per generare numero random
int randomNum(int max) {
  var random = Random();

  return random.nextInt(max);
}

// final teamBlue = [
//   Warrior('Spiderman', 25, 15, 'assets/images/cavaliere_2.png', 'Ragnatela'),
//   Archer('Legolas', 18, 10, 'assets/images/arciere_2.png', 'Tre freccie'),
//   Knight('Warm', 27, 20, 'assets/images/cavaliere_2_1.png', 'Carica superiore'),
// ];

// //istanzio il team red
// final teamRed = [
//   Warrior(
//       'He-Man', 17, 15, 'assets/images/cavaliere_1.png', 'Graffio profondo'),
//   Archer('Atinius', 22, 10, 'assets/images/arciere_1.png', 'Freccie circolari'),
//   Knight('Mah', 25, 20, 'assets/images/cavaliere_1_1.png', 'Carica superiore'),
// ];
