import 'package:flutter/material.dart';

class SlotCreate extends StatelessWidget {
  final Widget child;
  final String? text;
  const SlotCreate({
    this.text,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.amber.shade200),
        ),
      ),
      child: Column(
        children: [
          text != null
              ? Text(
                  text!.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.amber.shade700,
                    shadows: [
                      BoxShadow(
                        blurRadius: 1,
                        spreadRadius: 2,
                        color: Colors.black26,
                      )
                    ],
                  ),
                )
              : SizedBox(
                  width: 3,
                ),
          SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
