import 'package:flutter/material.dart';
import 'package:iconamoon/iconamoon.dart';

class AllAppBarTab extends StatelessWidget {
  final String title;
  final String imgPath;
  final bool showBackButton;

  const AllAppBarTab({
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
  final TabBar _tabBar;

  _SliverAppBarDelegate({
    required this.expandedHeight,
    required this.title,
    required this.imgPath,
    this.showBackButton = true,
  }) : _tabBar = TabBar(
          tabs: [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
          ],
        );

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
        Positioned(
          bottom: 20,
          left: 45,
          right: 45,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                _tabBar,
                SizedBox(
                  height: kToolbarHeight, // ความสูงของ TabBarView
                  child: TabBarView(
                    children: [
                      // รายละเอียดของ Tab 1
                      Center(child: Text('Tab 1 Content')),

                      // รายละเอียดของ Tab 2
                      Center(child: Text('Tab 2 Content')),
                    ],
                  ),
                ),
              ],
            ),
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
