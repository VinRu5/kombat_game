import 'package:flutter/material.dart';

/// classe che salva le frasi dei duellanti
class Sentence {
  late String text;
  late IconData action;
  late Color color;

  Sentence({
    required this.text,
    required this.action,
    required this.color,
  });
}

/// classe che gestisce il turno
class SentenceTurn {
  late Sentence userSentence;
  late Sentence challangerSentence;
  late int turn;

  SentenceTurn({
    required this.userSentence,
    required this.challangerSentence,
    required this.turn,
  });
}
