import 'package:flutter/material.dart';
import 'package:kombat_game/components/sentence_card.dart';
import 'package:kombat_game/functions/sentence.dart';

class Sentences extends StatelessWidget {
  final SentenceTurn sentences;

  const Sentences({
    required this.sentences,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          sentences.turn.toString(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.amber.shade700,
            shadows: [
              Shadow(
                color: Colors.black12,
                blurRadius: 5,
              ),
            ],
          ),
        ),
        SentenceCard(sentence: sentences.userSentence),
        SentenceCard(sentence: sentences.challangerSentence),
      ],
    );
  }
}
