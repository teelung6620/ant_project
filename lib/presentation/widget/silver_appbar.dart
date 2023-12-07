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

    return SliverPersistentHeader(
      delegate: _SliverAppBarDelegate(
        expandedHeight: 240,
        title: title,
        imgPath: imgPath,
        showBackButton: showBackButton,
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String title;
  final String imgPath;
  final bool showBackButton;

  _SliverAppBarDelegate({
    required this.expandedHeight,
    required this.title,
    required this.imgPath,
    this.showBackButton = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          imgPath,
          fit: BoxFit.cover,
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
          bottom: 80,
          left: 45,
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
