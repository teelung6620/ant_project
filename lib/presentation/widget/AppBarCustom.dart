import 'package:ant_project/src/components/home_page.dart';
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
    return Container(
      height: MediaQuery.of(context).size.height * 0.28,
      child: Column(
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
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
            ),
          Spacer(),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.08),
              Text(
                (title),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.09),
        ],
      ),
    );
  }
}
