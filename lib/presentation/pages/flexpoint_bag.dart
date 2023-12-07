import 'package:ant_project/presentation/widget/AppBarCustom2.dart';
import 'package:ant_project/presentation/widget/button_exchange_bag.dart';
import 'package:ant_project/presentation/widget/silver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:iconamoon/iconamoon.dart';

class FlexpointBagPage extends StatefulWidget {
  const FlexpointBagPage({Key? key}) : super(key: key);
  @override
  State<FlexpointBagPage> createState() => _FlexpointBagState();
}

class _FlexpointBagState extends State<FlexpointBagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        AppBarCustom2(
          title: 'กระเป๋า Flexpoint',
          imgPath: 'assets/images/flexpointbag_appbar.png',
        ),
        Container(
          height: 488.64, // Adjust the height as needed
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bagpointbackground.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            Spacer(),
            Text(
              'Flexpoint ที่มี',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ButtonExchangeBag(),
          ]),
          // Your other widgets or content goes here
        ),
      ],
    ));
  }
}
