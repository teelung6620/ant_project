import 'package:ant_project/widget/product_list.dart';
import 'package:ant_project/widget/flexpoint_list.dart';
import 'package:ant_project/widget/insurance_list.dart';
import 'package:flutter/material.dart';

class ProductLayout extends StatelessWidget {
  const ProductLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductList(
            title: 'หม้อทอดไร้น้ำมัน',
            imgPath: 'assets/images/image 8.png',
            describ: 'anabishi หม้อทอดไร้น้ำมัน 4 ลิตร',
            avai: '9',
            coins: '30',
          ),
          ProductList(
            title: 'ทองคำ 2 สลึง',
            imgPath: 'assets/images/gold.png',
            describ: 'anabishi',
            avai: '9',
            coins: '30',
          ),
        ],
      ),
    );
  }
}
