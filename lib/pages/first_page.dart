import 'package:ant_project/widget/circle_layout.dart';
import 'package:ant_project/widget/coin_exchange.dart';
import 'package:ant_project/widget/flexpoint_layout.dart';
import 'package:ant_project/widget/insurance_layout.dart';
import 'package:ant_project/widget/text_header.dart';
import 'package:ant_project/widget/text_list.dart';
import 'package:ant_project/widget/text_listbutton.dart';
import 'package:ant_project/widget/text_welcome.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);
  @override
  State<FirstPage> createState() => _FirstState();
}

class _FirstState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 8, right: 8, bottom: 95),
            child: Column(
              children: [
                Container(
                    child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextHeader(
                          title: 'Hi, Somjai!',
                        ),
                        TextWelcome(
                          title: 'Welcome back',
                        )
                      ],
                    ),
                    Spacer(),
                    Image.asset('assets/images/Group 728.png'),
                    // CircleAvatar(
                    //     radius: 35,
                    //     child: Icon(
                    //       Icons.account_circle_outlined,
                    //       size: 50,
                    //     ))
                    SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                  ],
                )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const CoinExchange(
                  title: '26',
                ),
                // CircleIcons(
                //   title: 'test',
                // ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const CircleLayout(),
                const Row(
                  children: [
                    TextList(
                      title: 'ประกันที่น่าสนใจ',
                    ),
                    Spacer(),
                    TextListButton(
                      title: 'ดูทั้งหมด',
                    )
                  ],
                ),
                // Row(
                //   children: [
                //     Column(
                //       children: [
                //         InsuranceList(
                //             title: 'jimmy', imagePath: 'assets/images/aia.jpg')
                //       ],
                //     ),
                //   ],
                // )
                const InsuranceLayout(),

                const Row(
                  children: [
                    TextList(
                      title: 'แลก Flexpoint',
                    ),
                    Spacer(),
                    TextListButton(
                      title: 'ดูทั้งหมด',
                    )
                  ],
                ),

                const FlexpointLayout(),
              ],
            )),
      ),
    );
  }
}
