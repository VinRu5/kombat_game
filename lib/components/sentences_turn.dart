import 'package:flutter/material.dart';
import 'package:kombat_game/components/sentences.dart';
import 'package:kombat_game/models/sentence.dart';

/// Classe che renderizza le frasi dei duellanti
class SentencesTurn extends StatelessWidget {
  final List<SentenceTurn> sentences;
  const SentencesTurn({
    required this.sentences,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: sentences.map((turn) => Sentences(sentences: turn)).toList(),
    );
  }
}
