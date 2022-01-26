import 'package:flutter/material.dart';
import 'package:kombat_game/components/sentence_card.dart';
import 'package:kombat_game/functions/sentence.dart';

class Sentences extends StatelessWidget {
  final List<Sentence> userSentences;
  final List<Sentence> challangerSentences;
  const Sentences({
    required this.userSentences,
    required this.challangerSentences,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: userSentences
              .map((sentence) => SentenceCard(sentence: sentence))
              .toList(),
        ),
        Column(
          children: challangerSentences
              .map((sentence) => SentenceCard(sentence: sentence))
              .toList(),
        ),
      ],
    );
  }
}
