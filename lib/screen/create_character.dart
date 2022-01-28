import 'package:flutter/material.dart';
import 'package:kombat_game/components/character_card.dart';
import 'package:kombat_game/components/slot_create.dart';
import 'package:kombat_game/models/character.dart';

enum Photo {
  warriorBlue,
  warriorRed,
  archerBlue,
  archerRed,
  knigthBlue,
  knigthRed,
}

class CreateCharacter extends StatefulWidget {
  const CreateCharacter({Key? key}) : super(key: key);

  @override
  _CreateCharacterState createState() => _CreateCharacterState();
}

class _CreateCharacterState extends State<CreateCharacter> {
  Photo? photoValue = Photo.warriorBlue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          SlotCreate(
            child: Text(
              'Crea il tuo eroe',
              style: TextStyle(
                fontSize: 30,
                color: Colors.amber.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SlotCreate(
            text: 'Inserisci il nome del tuo Eroe',
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
          SlotCreate(
            child: viewImages(),
            text: 'Scegli la tua immagine',
          ),
          SlotCreate(
            child: Text('ciao'),
            text: 'Scegli la tue caratteristiche',
          ),
        ],
      ),
    );
  }

  Widget viewImages() => Row(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //TODO: riempire qui
                ],
              ),
            ),
          )
        ],
      );
}
