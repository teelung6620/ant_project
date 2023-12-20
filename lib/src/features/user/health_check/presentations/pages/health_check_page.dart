import 'package:ant_project/injection_container.dart';
import 'package:ant_project/presentation/widget/AppBarCustom2.dart';
import 'package:ant_project/presentation/widget/employee.dart';
import 'package:ant_project/presentation/widget/employee_layout.dart';
import 'package:ant_project/presentation/widget/privileges_2.dart';
import 'package:ant_project/presentation/widget/silver_appbar.dart';
import 'package:ant_project/presentation/widget/total_credit.dart';
import 'package:ant_project/src/core/constant/network_api.dart';
import 'package:ant_project/src/features/user/health_check/presentations/bloc/get_hospital_bloc.dart';
import 'package:ant_project/src/features/user/health_check/presentations/pages/detail_page.dart';
import 'package:ant_project/src/features/user/health_check/presentations/widget/health_package.dart';
import 'package:ant_project/src/features/user/health_check/presentations/widget/health_package_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconamoon/iconamoon.dart';

class HealthCheckPage extends StatefulWidget {
  const HealthCheckPage({Key? key}) : super(key: key);
  @override
  State<HealthCheckPage> createState() => _HealthCheckState();
}

class _HealthCheckState extends State<HealthCheckPage> {
  final getHospitalBloc = sl<GetHospitalBloc>();

  @override
  void initState() {
    super.initState();
    getHospitalBloc.add(GetHospitalDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppBarCustom2(
                title: 'แพคเกจตรวจสุขภาพ',
                imgPath: 'assets/images/Group 721.png',
                showBackButton: true,
              ),
              Container(
                child: BlocProvider(
                  create: (context) => getHospitalBloc,
                  child: BlocBuilder<GetHospitalBloc, GetHospitalState>(
                    builder: (context, state) {
                      if (state is GetHospitalInitial) {
                        return Text('errIni');
                      } else if (state is GetHospitalLoading) {
                        return CircularProgressIndicator(
                          color: Colors.pink[100],
                        );
                      } else if (state is GetHospitalFailure) {
                        return Text('failure');
                      } else if (state is GetHospitalSuccess) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 1.2,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.getHospital.length,
                            itemBuilder: (context, index) {
                              return HealthPackage(
                                imgPath:
                                    '${NetworkAPI.baseURL}api/image/${state.getHospital[index].image}',
                                name: state.getHospital[index].name.toString(),
                                location: state.getHospital[index].location
                                    .toString(),
                                rating:
                                    state.getHospital[index].rating.toString(),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HospitalDetailPage(
                                              hospital:
                                                  state.getHospital[index],
                                              // id: state.getHospital[index]
                                              //         .id ??
                                              //     0
                                            )),
                                  );
                                },
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
            ],
          ),
        ),
      ),
    );
  }
}
