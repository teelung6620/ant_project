import 'package:ant_project/injection_container.dart';
import 'package:ant_project/presentation/widget/AppBarCustom2.dart';
import 'package:ant_project/src/features/user/home/presentations/bloc/get_profile_bloc.dart';
import 'package:ant_project/src/features/user/home/presentations/widget/button_exchange_bag.dart';
import 'package:ant_project/presentation/widget/silver_appbar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconamoon/iconamoon.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';

class FlexpointBagPage extends StatefulWidget {
  const FlexpointBagPage({Key? key}) : super(key: key);

  @override
  State<FlexpointBagPage> createState() => _FlexpointBagState();
}

class _FlexpointBagState extends State<FlexpointBagPage> {
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
        child: Stack(
          children: [
            // Background Container
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bagpointbackground.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                // AppBar
                AppBarCustom2(
                  title: 'กระเป๋า Flexpoint',
                  imgPath: 'assets/images/flexpointbag_appbar.png',
                ),
                // Pie Chart
                Container(
                  //color: Colors.black,
                  height: MediaQuery.of(context).size.height * 0.5,
                  // Adjust the height as needed
                  child: BlocBuilder<GetProfileBloc, GetProfileState>(
                    builder: (context, state) {
                      if (state is GetProfileInitial) {
                        return Text('errIni');
                      } else if (state is GetProfileLoading) {
                        return CircularProgressIndicator();
                      } else if (state is GetProfileFailure) {
                        return Text('failure');
                      } else if (state is GetProfileSuccess) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              //height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/SCGC.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                PieChart(PieChartData(
                                  centerSpaceRadius: 110,
                                  sections: [
                                    PieChartSectionData(
                                      radius: 12,
                                      color: Color(0xFFFFE4EB),
                                      value: state
                                              .getProfile.uniwelfareFlexcoins
                                              ?.toDouble() ??
                                          0.0, // ค่าข้อมูล
                                      title: '',

                                      // title:
                                      //     '${state.getProfile.uniwelfareFlexcoins}',
                                    ),
                                    PieChartSectionData(
                                      radius: 12,
                                      color: Color.fromARGB(255, 245, 245, 245),
                                      value: (1500 -
                                              (state.getProfile
                                                      .uniwelfareFlexcoins
                                                      ?.toDouble() ??
                                                  0.0))
                                          .clamp(0.0, 1500.0),
                                      title: '',
                                      // title:
                                      //     '${(1500 - (state.getProfile.uniwelfareFlexcoins?.toDouble() ?? 0.0)).toStringAsFixed(0)}',
                                    ),
                                  ],
                                  startDegreeOffset: -90,
                                )),
                                PieChart(PieChartData(
                                  centerSpaceRadius: 120,
                                  sections: [
                                    PieChartSectionData(
                                      radius: 12,
                                      color: Color(0xFFFCB0C2),

                                      value: state
                                              .getProfile.uniwelfareFlexcoins
                                              ?.toDouble() ??
                                          0.0, // ค่าข้อมูล
                                      title: '',

                                      // title:
                                      //     '${state.getProfile.uniwelfareFlexcoins}',
                                    ),
                                    PieChartSectionData(
                                      radius: 12,
                                      color: Color.fromARGB(255, 237, 237, 237),
                                      value: (1500 -
                                              (state.getProfile
                                                      .uniwelfareFlexcoins
                                                      ?.toDouble() ??
                                                  0.0))
                                          .clamp(0.0, 1500.0),
                                      title: '',
                                      // title:
                                      //     '${(1500 - (state.getProfile.uniwelfareFlexcoins?.toDouble() ?? 0.0)).toStringAsFixed(0)}',
                                    ),
                                  ],
                                  startDegreeOffset: -90,
                                )),
                              ],
                            ),
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                ),
                // Spacer
                Spacer(),
                // Text
                Text(
                  'Flexpoint ที่มี',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                // Button
                Container(
                  // color: Colors.black,
                  height: 50, // Adjust the height as needed
                  child: BlocBuilder<GetProfileBloc, GetProfileState>(
                    builder: (context, state) {
                      if (state is GetProfileInitial) {
                        return Text('errIni');
                      } else if (state is GetProfileLoading) {
                        return CircularProgressIndicator();
                      } else if (state is GetProfileFailure) {
                        return Text('failure');
                      } else if (state is GetProfileSuccess) {
                        return ButtonExchangeBag(
                            flexpoint:
                                '${state.getProfile.uniwelfareFlexcoins}');
                      }
                      return Container();
                    },
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<PieChartSectionData> getSections() {
  List<PieChartSectionData> sections = [];
  sections.add(
    PieChartSectionData(
      color: Colors.blue,
      value: 20, // ค่าข้อมูล

      title: 'Section 1',
    ),
  );

  sections.add(
    PieChartSectionData(
      color: Colors.blue,
      value: 100 - 20, // ค่าข้อมูล

      title: 'Section 2',
    ),
  );

  return sections;
}
