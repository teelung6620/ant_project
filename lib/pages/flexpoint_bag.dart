import 'package:ant_project/widget/product_list.dart';
import 'package:ant_project/widget/product_layout.dart';
import 'package:flutter/material.dart';

class FlexpointBagPage extends StatefulWidget {
  const FlexpointBagPage({Key? key}) : super(key: key);
  @override
  State<FlexpointBagPage> createState() => _FlexpointBagState();
}

class _FlexpointBagState extends State<FlexpointBagPage> {
  @override
  Widget build(BuildContext context) {
    double rightValue = MediaQuery.of(context).size.width * 0.03;
    double bottomValue = MediaQuery.of(context).size.width * 0.015;
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          // automaticallyImplyLeading: false,
          // leading: IconButton(
          //  icon: Icon(Icons.arrow_back),
//onPressed: () {
          //    Navigator.pop(context);
          //   },
          //  ),
          title: Text(
            ('กระเป๋า Flexpoint'),
            style: TextStyle(fontSize: 20),
          ),

          //centerTitle: true,
          // backgroundColor: Color(0xFF363062),
          toolbarHeight: MediaQuery.of(context).size.height * 0.23,
          flexibleSpace: Stack(
            children: [
              Image.asset(
                'assets/images/Vector 8.png',
                fit: BoxFit.fill,
              ),
              Positioned(
                right: rightValue,
                bottom: bottomValue,
                child: Image.asset(
                  'assets/images/bagcoin.png',
                  scale: MediaQuery.of(context).size.width * 0.0025,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
        ));
  }
}
