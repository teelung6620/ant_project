import 'package:ant_project/widget/AppBarCustom.dart';
import 'package:ant_project/widget/product_layout.dart';
import 'package:flutter/material.dart';
import 'package:iconamoon/iconamoon.dart';

class FlexpointPage extends StatefulWidget {
  const FlexpointPage({Key? key}) : super(key: key);
  @override
  State<FlexpointPage> createState() => _FlexpointState();
}

class _FlexpointState extends State<FlexpointPage> {
  @override
  Widget build(BuildContext context) {
    double rightValue = MediaQuery.of(context).size.width * 0.03;
    double bottomValue = MediaQuery.of(context).size.width * 0.1;
    return DefaultTabController(
      length: 7,
      child: Scaffold(
          appBar: AppBar(
            // automaticallyImplyLeading: false,
            leadingWidth: 200,
            leading:
                AppBarCustom(title: 'แลก Flexpoint', showBackButton: false),
            //centerTitle: true,
            // backgroundColor: Color(0xFF363062),
            toolbarHeight: MediaQuery.of(context).size.height * 0.23,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  child: Image.asset(
                    'assets/images/Group 725.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'ทั้งหมด',
                ),
                Tab(
                  text: 'อาหาร',
                ),
                Tab(
                  text: 'ชอปปิง',
                ),
                Tab(
                  text: 'ความบันเทิง',
                ),
                Tab(
                  text: 'ไลฟ์สไตล์',
                ),
                Tab(
                  text: 'ท่องเที่ยว',
                ),
                Tab(
                  text: 'สุขภาพ',
                ),
              ],
              indicatorColor: Colors.pink,
              labelColor: Colors.pink,
            ),
            // actions: [
            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Image.asset(
            //       'assets/images/tradecoin.png',
            //       scale: MediaQuery.of(context).size.width * 0.002,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(
              children: [
                Container(
                  child: const SingleChildScrollView(
                    child: Column(
                      children: [ProductLayout()],
                    ),
                  ),
                ),
                Container(
                  child: const Text('อาหาร'),
                ),
                Container(
                  child: const Text('ชอปปิง'),
                ),
                Container(
                  child: const Text('ความบันเทิง'),
                ),
                Container(
                  child: const Text('ไลฟ์สไตล์'),
                ),
                Container(
                  child: const Text('ท่องเที่ยว'),
                ),
                Container(
                  child: const Text('สุขภาพ'),
                ),
              ],
            ),
          )),
    );
  }
}
