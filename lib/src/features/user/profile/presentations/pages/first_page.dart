import 'package:ant_project/injection_container.dart';
import 'package:ant_project/presentation/widget/circle_layout.dart';
import 'package:ant_project/presentation/widget/coin_exchange.dart';
import 'package:ant_project/presentation/widget/flexpoint_layout.dart';
import 'package:ant_project/presentation/widget/insurance_layout.dart';
import 'package:ant_project/presentation/widget/text_header.dart';
import 'package:ant_project/presentation/widget/text_list.dart';
import 'package:ant_project/presentation/widget/text_listbutton.dart';
import 'package:ant_project/presentation/widget/text_welcome.dart';
import 'package:ant_project/src/core/constant/network_api.dart';
import 'package:ant_project/src/features/user/profile/presentations/bloc/get_profile_bloc.dart';
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
                                return CircularProgressIndicator();
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
                            return CircularProgressIndicator();
                          } else if (state is GetProfileFailure) {
                            return Text('failure');
                          } else if (state is GetProfileSuccess) {
                            return CircleAvatar(
                              radius: 30,
                              child: ClipOval(
                                child: state.getProfile.imageProfile != null
                                    ? Image.network(
                                        '${NetworkAPI.baseURL}api/image/profile/${state.getProfile.imageProfile}',
                                      )
                                    : Icon(Icons.account_circle,
                                        size:
                                            20), // แทนด้วย Account Icon ของคุณ
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
      ),
    );
  }
}
