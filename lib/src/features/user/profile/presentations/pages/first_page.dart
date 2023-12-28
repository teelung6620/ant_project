import 'package:ant_project/injection_container.dart';
import 'package:ant_project/presentation/widget/coin_exchange.dart';
import 'package:ant_project/presentation/widget/flexpoint_layout.dart';
import 'package:ant_project/presentation/widget/insurance_layout.dart';
import 'package:ant_project/presentation/widget/text_header.dart';
import 'package:ant_project/presentation/widget/text_list.dart';
import 'package:ant_project/presentation/widget/text_listbutton.dart';
import 'package:ant_project/presentation/widget/text_welcome.dart';
import 'package:ant_project/src/core/constant/network_api.dart';
import 'package:ant_project/src/features/user/profile/presentations/bloc/get_profile_bloc.dart';
import 'package:ant_project/src/features/user/profile/presentations/widget/circle_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);
  @override
  State<FirstPage> createState() => _FirstState();
}

class _FirstState extends State<FirstPage> {
  final getProfileBloc = sl<GetProfileBloc>();

  @override
  void initState() {
    super.initState();
    getProfileBloc.add(GetProfileDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getProfileBloc,
        child: SingleChildScrollView(
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
                          BlocBuilder<GetProfileBloc, GetProfileState>(
                            builder: (context, state) {
                              if (state is GetProfileInitial) {
                                return Text('errIni');
                              } else if (state is GetProfileLoading) {
                                return CircularProgressIndicator(
                                  color:
                                      const Color.fromARGB(255, 255, 144, 181),
                                );
                              } else if (state is GetProfileFailure) {
                                return Text('failure');
                              } else if (state is GetProfileSuccess) {
                                return TextHeader(
                                  title: 'Hi, ${state.getProfile.firstnameTh}',
                                );
                              }
                              return Container();
                            },
                          ),
                          TextWelcome(
                            title: 'Welcome back',
                          )
                        ],
                      ),
                      Spacer(),
                      BlocBuilder<GetProfileBloc, GetProfileState>(
                        builder: (context, state) {
                          if (state is GetProfileInitial) {
                            return Text('errIni');
                          } else if (state is GetProfileLoading) {
                            return CircularProgressIndicator(
                                color:
                                    const Color.fromARGB(255, 255, 187, 210));
                          } else if (state is GetProfileFailure) {
                            return Text('failure');
                          } else if (state is GetProfileSuccess) {
                            return CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 173, 200),
                              radius: 30,
                              child: ClipOval(
                                child: state.getProfile.imageProfile != null
                                    ? Image.network(
                                        '${NetworkAPI.baseURL}api/image/profile/${state.getProfile.imageProfile}',
                                      )
                                    : Icon(
                                        Icons.account_circle,
                                        size: 50,
                                        color: Colors.white,
                                      ), // แทนด้วย Account Icon ของคุณ
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
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
                  BlocBuilder<GetProfileBloc, GetProfileState>(
                    builder: (context, state) {
                      if (state is GetProfileInitial) {
                        return Text('errIni');
                      } else if (state is GetProfileLoading) {
                        return CircularProgressIndicator(
                            color: const Color.fromARGB(255, 255, 187, 210));
                      } else if (state is GetProfileFailure) {
                        return Text('failure');
                      } else if (state is GetProfileSuccess) {
                        return LayoutBuilder(builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).devicePixelRatio * 10,
                              vertical:
                                  MediaQuery.of(context).devicePixelRatio * 2,
                            ),
                            height: 180.0,
                            width: constraints.maxWidth,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFE7EB),
                              borderRadius:
                                  BorderRadius.circular(10), // กำหนดขอบโค้ง
                            ),
                            // color: Color.fromARGB(255, 255, 213, 227),
                            //decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Flexcoin ของฉัน',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(children: [
                                      Text(
                                        state.getProfile.uniwelfareFlexcoins
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 50,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFFFF7697),
                                          foregroundColor: Colors.white),
                                      onPressed: () {
                                        // ตอบสนองเมื่อปุ่มถูกกด
                                      },
                                      child: const Text(
                                        'แลก Flexcoin',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Image.asset(
                                  'assets/images/image 2 (1).png',
                                  scale: 1,
                                )
                              ],
                            ),
                          );
                        });
                      }
                      return Container();
                    },
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
      ),
    );
  }
}
