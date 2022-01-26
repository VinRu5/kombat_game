import 'package:flutter/material.dart';

class Jumbotron extends StatelessWidget {
  final String url;
  const Jumbotron(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      url,
      width: 200,
      height: 150,
      fit: BoxFit.cover,
    );
  }
}
