import 'package:flutter/material.dart';
import 'package:iconamoon/iconamoon.dart';

class AppBarCustom extends StatelessWidget {
  final String title;
  final bool showBackButton;
  const AppBarCustom({
    Key? key,
    required this.title,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showBackButton)
          Container(
            child: IconButton(
              icon: Icon(
                IconaMoon.arrowLeft2,
                size: 40,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        Spacer(),
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.08),
            Text(
              (title),
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.08),
      ],
    );
  }
}
