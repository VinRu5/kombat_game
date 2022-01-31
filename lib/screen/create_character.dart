import 'package:flutter/material.dart';
import 'package:kombat_game/components/editor_line.dart';
import 'package:kombat_game/components/slot_create.dart';
import 'package:kombat_game/models/character.dart';

class CreateCharacter extends StatefulWidget {
  const CreateCharacter({Key? key}) : super(key: key);

  @override
  _CreateCharacterState createState() => _CreateCharacterState();
}

class _CreateCharacterState extends State<CreateCharacter> {
  Photo photoValue = Photo.warriorBlue;
  TextEditingController inputText = TextEditingController();
  int attackValue = 10;
  int defenseValue = 10;
  bool _validate = false;

  void setRadio(value) {
    setState(() {
      photoValue = value;
    });
  }

  void generateHero() {
    if (inputText.text.isEmpty) {
      setState(() {
        _validate = true;
      });
    } else {
      _validate = false;
      Character hero = Warrior(
        inputText.text,
        attackValue,
        defenseValue,
        'assets/images/cavaliere_2.png',
        Team.blue,
        photoValue,
        '',
      );

      switch (photoValue) {
        case Photo.archerBlue:
          hero = Archer(
            inputText.text,
            attackValue,
            defenseValue,
            'assets/images/arciere_2.png',
            Team.blue,
            photoValue,
            '',
          );
          break;
        case Photo.warriorBlue:
          hero = Warrior(
            inputText.text,
            attackValue,
            defenseValue,
            'assets/images/cavaliere_2.png',
            Team.blue,
            photoValue,
            '',
          );
          break;
        case Photo.archerRed:
          hero = Archer(
            inputText.text,
            attackValue,
            defenseValue,
            'assets/images/arciere_1.png',
            Team.red,
            photoValue,
            '',
          );
          break;
        case Photo.knigthBlue:
          hero = Knight(
            inputText.text,
            attackValue,
            defenseValue,
            'assets/images/cavaliere_2_1.png',
            Team.blue,
            photoValue,
            '',
          );
          break;
        case Photo.warriorRed:
          hero = Archer(
            inputText.text,
            attackValue,
            defenseValue,
            'assets/images/cavaliere_1.png',
            Team.red,
            photoValue,
            '',
          );
          break;
        case Photo.knigthRed:
          hero = Archer(
            inputText.text,
            attackValue,
            defenseValue,
            'assets/images/cavaliere_1_1.png',
            Team.red,
            photoValue,
            '',
          );
          break;
      }

      setTeams.add(hero);
      print(hero);
    }

    inputText.clear();
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
              cursorColor: Colors.amber.shade700,
              decoration: InputDecoration(
                errorText: _validate ? 'Devi inserire un nome' : null,
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Colors.amber.shade700),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),

                  //borderSide: const BorderSide(color: Colors.red, width: 0.0),
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
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber.shade700),
            ),
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
          SizedBox(
            height: 250,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.7,
              ),
              itemCount: viewRadio.length,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: viewRadio[index].team == Team.blue
                        ? Colors.blue
                        : Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      viewRadio[index].asset,
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                    Radio(
                      fillColor:
                          MaterialStateProperty.all(Colors.amber.shade700),
                      value: viewRadio[index].value,
                      groupValue: photoValue,
                      onChanged: (value) => setRadio(value),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      );
}
