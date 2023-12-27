import 'package:ant_project/injection_container.dart';
import 'package:ant_project/presentation/widget/AppBarCustom.dart';
import 'package:ant_project/src/features/user/insurance/presentations/bloc/get_insurance_bloc.dart';
import 'package:ant_project/src/features/user/insurance/presentations/widget/insurance_all_layout.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InsurancePage extends StatefulWidget {
  const InsurancePage({Key? key}) : super(key: key);

  @override
  State<InsurancePage> createState() => _InsuranceState();
}

class _InsuranceState extends State<InsurancePage> {
  final getInsuranceBloc = sl<GetInsuranceBloc>();

  @override
  void initState() {
    super.initState();
    getInsuranceBloc.add(GetInsuranceDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6, // จำนวน Tab ทั้งหมด
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 200,
            leading: AppBarCustom(
              title: 'ซื้อประกัน',
            ),
            // automaticallyImplyLeading: false,
            // title: const Text(
            //   ('แลก Flexpoint'),
            //   style: TextStyle(fontSize: 20),
            // ),
            //centerTitle: true,
            // backgroundColor: Color(0xFF363062),
            toolbarHeight: MediaQuery.of(context).size.height * 0.23,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  child: Image.asset(
                    'assets/images/Group 723.png',
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
                  text: 'ประกันสุขภาพ',
                ),
                Tab(
                  text: 'ประกันกลุ่ม',
                ),
                Tab(
                  text: 'ประกันบุคคล',
                ),
                Tab(
                  text: 'ประกันอุบัติเหตุ',
                ),
                Tab(
                  text: 'ประกันชีวิต',
                ),
              ],
              indicatorColor: Colors.pink,
              labelColor: Colors.pink,
              tabAlignment: TabAlignment.start,
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocProvider(
                create: (context) => getInsuranceBloc,
                child: TabBarView(children: [
                  Container(
                    child: SingleChildScrollView(
                        child: BlocBuilder<GetInsuranceBloc, GetInsuranceState>(
                      builder: (context, state) {
                        if (state is GetInsuranceInitial) {
                          return Text('errIni');
                        } else if (state is GetInsuranceLoading) {
                          return CircularProgressIndicator(
                            color: Colors.pink[100],
                          );
                        } else if (state is GetInsuranceFailure) {
                          return Text('failure');
                        } else if (state is GetInsuranceSuccess) {
                          return Container(
                            height: MediaQuery.of(context).size.height *
                                state.getInsurance.length *
                                0.2,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: state.getInsurance.length,
                              itemBuilder: (context, index) {
                                return InsuranceAllLayout(
                                    imgPath: state.getInsurance[index].image
                                        .toString(),
                                    title: state.getInsurance[index].name
                                        .toString(),
                                    detail: state.getInsurance[index].detail
                                        .toString(),
                                    company: state
                                        .getInsurance[index].companyName
                                        .toString(),
                                    distance: state
                                        .getInsurance[index].protectionPeriod
                                        .toString(),
                                    onTap: () {});
                              },
                            ),
                          );
                        }
                        return Container();
                      },
                    )),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      child: BlocBuilder<GetInsuranceBloc, GetInsuranceState>(
                        builder: (context, state) {
                          if (state is GetInsuranceInitial) {
                            return Text('errIni');
                          } else if (state is GetInsuranceLoading) {
                            return CircularProgressIndicator(
                              color: Colors.pink[100],
                            );
                          } else if (state is GetInsuranceFailure) {
                            return Text('failure');
                          } else if (state is GetInsuranceSuccess) {
                            // กรองเฉพาะรายการประกันที่มี "categoryName": "ประกันสุขภาพ"
                            var healthInsuranceList = state.getInsurance
                                .where((insurance) =>
                                    insurance.categoryName == "ประกันสุขภาพ")
                                .toList();

                            return Container(
                              height: MediaQuery.of(context).size.height *
                                  healthInsuranceList.length *
                                  0.2,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: healthInsuranceList.length,
                                itemBuilder: (context, index) {
                                  return InsuranceAllLayout(
                                    imgPath: healthInsuranceList[index]
                                        .image
                                        .toString(),
                                    title: healthInsuranceList[index]
                                        .name
                                        .toString(),
                                    detail: healthInsuranceList[index]
                                        .detail
                                        .toString(),
                                    company: healthInsuranceList[index]
                                        .companyName
                                        .toString(),
                                    distance: healthInsuranceList[index]
                                        .protectionPeriod
                                        .toString(),
                                    onTap: () {},
                                  );
                                },
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: const SingleChildScrollView(
                      child: Column(
                        children: [],
                      ),
                    ),
                  ),
                  Container(
                    child: const SingleChildScrollView(
                      child: Column(
                        children: [],
                      ),
                    ),
                  ),
                  Container(
                    child: const SingleChildScrollView(
                      child: Column(
                        children: [],
                      ),
                    ),
                  ),
                  Container(
                    child: const SingleChildScrollView(
                      child: Column(
                        children: [],
                      ),
                    ),
                  ),
                ]),
              )),
        ));
  }
}
