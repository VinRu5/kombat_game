import 'package:flutter/material.dart';

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
