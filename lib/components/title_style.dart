import 'package:flutter/material.dart';

/// genera automaticamente lo stile in base al colore passato
class TitleStyle extends StatelessWidget {
  final String text;
  final String color;
  const TitleStyle(this.text, this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24, top: 24),
      child: Text(
        text,
        style: TextStyle(
          color: colorTeam(),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Color colorTeam() {
    switch (color.toLowerCase()) {
      case 'blue':
        return Colors.blue;
      case 'red':
        return Colors.red;
      default:
        return Colors.amber;
    }
  }
}
