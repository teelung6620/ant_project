import 'package:flutter/material.dart';

class TextListButton extends StatelessWidget {
  final String title;
  const TextListButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).devicePixelRatio * 7.5,
          right: MediaQuery.of(context).devicePixelRatio * 7.5,
          bottom: MediaQuery.of(context).devicePixelRatio * 2),
      child: Row(children: [
        TextButton(
          style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 18),
              foregroundColor: Colors.pink),
          onPressed: () {},
          child: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ]),
    );
  }
}
