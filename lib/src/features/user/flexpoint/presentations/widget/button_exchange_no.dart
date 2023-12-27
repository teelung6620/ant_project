import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class ButtonExchangeNo extends StatefulWidget {
  final String title;
  const ButtonExchangeNo({required this.title, Key? key}) : super(key: key);

  @override
  _ButtonExchangeNoState createState() => _ButtonExchangeNoState();
}

class _ButtonExchangeNoState extends State<ButtonExchangeNo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: Color.fromARGB(255, 255, 215, 228),
              foregroundColor: Color.fromARGB(255, 255, 215, 228)),
          onPressed: () {},
          child: Text(
            widget.title,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ],
    );
  }
}
