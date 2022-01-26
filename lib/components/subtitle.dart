import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  final String value;
  const Subtitle(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Text(
          value,
          style: TextStyle(
              fontSize: 30,
              color: Colors.cyan.shade800,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
