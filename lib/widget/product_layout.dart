import 'package:ant_project/widget/product_list.dart';
import 'package:flutter/material.dart';

class ProductLayout extends StatelessWidget {
  const ProductLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ProductList(
            title: 'หม้อทอดไร้น้ำมัน',
            imgPath: 'assets/images/imageElec.png',
            describ: 'anabishi หม้อทอดไร้น้ำมัน 4 ลิตร',
            avai: '9',
            coins: '30',
          ),
          ProductList(
            title: 'ทองคำ 2 สลึง',
            imgPath: 'assets/images/gold2.png',
            describ: 'anabishi',
            avai: '9',
            coins: '30',
          ),
        ],
      ),
    );
  }
}
