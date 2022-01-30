import 'package:flutter/material.dart';

class EditorLine extends StatefulWidget {
  final String text;
  void Function(int value) onChange;
  EditorLine({
    required this.text,
    required this.onChange,
    Key? key,
  }) : super(key: key);

  @override
  _EditorLineState createState() => _EditorLineState();
}

class _EditorLineState extends State<EditorLine> {
  int value = 0;

  void addValue() {
    setState(() {
      value += 1;
    });
    widget.onChange(value);
  }

  void removeValue() {
    setState(() {
      value -= 1;
    });
    widget.onChange(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.text),
        Row(
          children: [
            IconButton(
              onPressed: removeValue,
              icon: Icon(Icons.remove),
            ),
            Text(value.toString()),
            IconButton(
              onPressed: addValue,
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
