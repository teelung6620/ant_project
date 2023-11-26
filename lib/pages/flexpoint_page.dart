import 'package:ant_project/widget/product_list.dart';
import 'package:ant_project/widget/product_layout.dart';
import 'package:flutter/material.dart';

class FlexpointPage extends StatefulWidget {
  const FlexpointPage({Key? key}) : super(key: key);
  @override
  State<FlexpointPage> createState() => _FlexpointState();
}

class _FlexpointState extends State<FlexpointPage> {
  @override
  Widget build(BuildContext context) {
    double rightValue = MediaQuery.of(context).size.width * 0.03;
    double bottomValue = MediaQuery.of(context).size.width * 0.015;
    return DefaultTabController(
      length: 7,
      child: Scaffold(
          appBar: AppBar(
            // automaticallyImplyLeading: false,
            title: Text(
              ('แลก Flexpoint'),
              style: TextStyle(fontSize: 25),
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
                    'assets/images/tradecoin.png',
                    scale: MediaQuery.of(context).size.width * 0.0023,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            bottom: TabBar(
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [ProductLayout()],
                    ),
                  ),
                ),
                Container(
                  child: Text('อาหาร'),
                ),
                Container(
                  child: Text('ชอปปิง'),
                ),
                Container(
                  child: Text('ความบันเทิง'),
                ),
                Container(
                  child: Text('ไลฟ์สไตล์'),
                ),
                Container(
                  child: Text('ท่องเที่ยว'),
                ),
                Container(
                  child: Text('สุขภาพ'),
                ),
              ],
            ),
          )),
    );
  }
}
