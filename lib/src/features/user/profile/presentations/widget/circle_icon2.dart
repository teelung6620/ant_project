import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final String title;
  final String imgPath;
  final VoidCallback onTap;
  const CircleIcon(
      {Key? key,
      required this.title,
      required this.imgPath,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).devicePixelRatio * 4,
          right: MediaQuery.of(context).devicePixelRatio * 4,
          bottom: MediaQuery.of(context).devicePixelRatio * 2),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imgPath),
              radius: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
