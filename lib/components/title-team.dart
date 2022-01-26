import 'package:flutter/material.dart';
import 'package:kombat_game/components/title_style.dart';

class TitleTeam extends StatelessWidget {
  const TitleTeam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          TitleStyle('Team Blue', 'blue'),
          TitleStyle('Team Red', 'red'),
        ]);
  }
}
