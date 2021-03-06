import 'package:flutter/material.dart';

/// renderizza il titolo del gioco
class TitleGame extends StatelessWidget {
  final String value;
  const TitleGame(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Text(
          value.toUpperCase(),
          style: TextStyle(
              fontSize: 40,
              color: Colors.amber.shade800,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
