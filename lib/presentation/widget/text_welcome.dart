import 'package:flutter/material.dart';

class TextWelcome extends StatelessWidget {
  final String title;
  const TextWelcome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).devicePixelRatio * 7.5,
          right: MediaQuery.of(context).devicePixelRatio * 7.5,
          bottom: MediaQuery.of(context).devicePixelRatio * 2),
      child: Row(children: [Text(title, style: const TextStyle(fontSize: 24))]),
    );
  }
}
