import 'package:flutter/material.dart';
import 'package:kombat_game/functions/sentence.dart';

class SentenceCard extends StatelessWidget {
  final Sentence sentence;
  const SentenceCard({
    required this.sentence,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(sentence.text),
          ),
          Icon(
            sentence.action,
            color: sentence.color,
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 2,
          color: sentence.color,
        ),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
    );
  }
}
