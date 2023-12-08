import 'package:ant_project/presentation/widget/AppBarCustom2line.dart';
import 'package:ant_project/src/features/user/flexpoint/presentations/widget/product_layout.dart';
import 'package:flutter/material.dart';
import 'package:iconamoon/iconamoon.dart';

class FlexpointHistoryPage extends StatefulWidget {
  const FlexpointHistoryPage({Key? key}) : super(key: key);
  @override
  State<FlexpointHistoryPage> createState() => _FlexpointHistoryState();
}

class _FlexpointHistoryState extends State<FlexpointHistoryPage> {
  @override
  Widget build(BuildContext context) {
    double rightValue = MediaQuery.of(context).size.width * 0.03;
    double bottomValue = MediaQuery.of(context).size.width * 0.1;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            // automaticallyImplyLeading: false,
            leadingWidth: 200,

            leading: AppBarCustom2Line(
                title: 'ประวัติการแลก\nFlexpoint', showBackButton: true),
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
                  text: 'รอตรวจสอบ',
                ),
                Tab(
                  text: 'สำเร็จ',
                ),
                Tab(
                  text: 'รับของรางวัลแล้ว',
                ),
                Tab(
                  text: 'ไม่สำเร็จ',
                ),
              ],
              indicatorColor: Colors.pink,
              labelColor: Colors.pink,
              tabAlignment: TabAlignment.start,
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
              ],
            ),
          )),
    );
  }
}
