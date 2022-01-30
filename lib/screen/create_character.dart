import 'package:flutter/material.dart';
import 'package:kombat_game/components/editor_line.dart';
import 'package:kombat_game/components/slot_create.dart';

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
  TextEditingController inputText = TextEditingController();
  int attackValue = 0;
  int defenseValue = 0;

  void setRadio(value) {
    setState(() {
      photoValue = value;
    });
  }

  void generateHero() {
    print(inputText.text);
    print(photoValue);
    print(attackValue);
    print(defenseValue);
  }

  void setAttackValue(value) {
    setState(() {
      attackValue = value;
    });
  }

  void setDefenseValue(value) {
    setState(() {
      defenseValue = value;
    });
  }

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
              controller: inputText,
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
            child: characterEditor(),
            text: 'Scegli la tue caratteristiche',
          ),
          ElevatedButton(
            onPressed: generateHero,
            child: Text('Crea'),
          ),
        ],
      ),
    );
  }

  Widget characterEditor() => Column(
        children: [
          EditorLine(
            text: 'Attacco',
            onChange: (value) => setAttackValue(value),
          ),
          EditorLine(
            text: 'Difesa',
            onChange: (value) => setDefenseValue(value),
          ),
        ],
      );

  Widget viewImages() => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/cavaliere_2.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  Radio(
                    value: Photo.warriorBlue,
                    groupValue: photoValue,
                    onChanged: (value) => setRadio(value),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/arciere_2.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  Radio(
                    value: Photo.archerBlue,
                    groupValue: photoValue,
                    onChanged: (value) => setRadio(value),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/cavaliere_2_1.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  Radio(
                    value: Photo.knigthBlue,
                    groupValue: photoValue,
                    onChanged: (value) => setRadio(value),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/cavaliere_1.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  Radio(
                    value: Photo.warriorRed,
                    groupValue: photoValue,
                    onChanged: (value) => setRadio(value),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/arciere_1.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  Radio(
                    value: Photo.archerRed,
                    groupValue: photoValue,
                    onChanged: (value) => setRadio(value),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/images/cavaliere_1_1.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  Radio(
                    value: Photo.knigthRed,
                    groupValue: photoValue,
                    onChanged: (value) => setRadio(value),
                  ),
                ],
              ),
            ],
          )
        ],
      );
}
