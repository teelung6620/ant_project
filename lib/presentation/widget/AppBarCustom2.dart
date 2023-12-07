import 'package:ant_project/src/components/home_page.dart';
import 'package:flutter/material.dart';
import 'package:iconamoon/iconamoon.dart';

class AppBarCustom2 extends StatelessWidget {
  final String title;
  final bool showBackButton;
  final String imgPath;
  const AppBarCustom2({
    Key? key,
    required this.title,
    required this.imgPath,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imgPath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
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
          if (!showBackButton)
            SizedBox(height: MediaQuery.of(context).size.height * 0.061),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.09),
              Text(
                (title),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
