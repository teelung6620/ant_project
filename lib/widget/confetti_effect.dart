import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiEffect extends StatelessWidget {
  final String title;
  const ConfettiEffect({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPLaying = false;
    final controller = ConfettiController();
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).devicePixelRatio * 7.5,
          right: MediaQuery.of(context).devicePixelRatio * 7.5,
          bottom: MediaQuery.of(context).devicePixelRatio * 2),
      child: Row(children: [Text(title, style: TextStyle(fontSize: 24))]),
    );
  }
}
