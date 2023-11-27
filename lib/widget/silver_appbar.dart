import 'package:flutter/material.dart';
import 'package:iconamoon/iconamoon.dart';

class AllAppBar extends StatelessWidget {
  final String title;
  final String imgPath;
  final bool showBackButton;

  const AllAppBar({
    Key? key,
    required this.title,
    required this.imgPath,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double rightValue = MediaQuery.of(context).size.width * 0.1;
    double bottomValue = MediaQuery.of(context).size.width * 0.07;
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 240,
      stretch: true,
      pinned: true,
      floating: false,
      // snap: ,
      flexibleSpace: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            child: Image.asset(
              imgPath,
              fit: BoxFit.cover,
            ),
          ),
          if (showBackButton)
            Positioned(
              top: 40,
              left: 5,
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
          Positioned(
            bottom: 100,
            left: 45,
            child: Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
          ),
          // Positioned(
          //   right: rightValue,
          //   bottom: bottomValue,
          //   child: Image.asset(
          //     imgPath,
          //     scale: MediaQuery.of(context).size.width * 0.0025,
          //     fit: BoxFit.cover,
          //   ),
          // ),
        ],
      ),
    );
  }
}
