import 'package:ant_project/injection_container.dart';
import 'package:ant_project/presentation/widget/AppBarCustom.dart';
import 'package:ant_project/presentation/widget/AppBarCustom2.dart';
import 'package:ant_project/presentation/widget/dropdown_year.dart';
import 'package:ant_project/presentation/widget/silver_appbar.dart';
import 'package:ant_project/src/core/features/user/presentation/provider/profile_provider.dart';
import 'package:ant_project/src/features/user/all_health_result/presentations/bloc/get_health_bloc.dart';
import 'package:ant_project/src/features/user/all_health_result/presentations/widget/redblodd_list.dart';
import 'package:ant_project/src/features/user/all_health_result/presentations/widget/redblood_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LipidPage extends StatefulWidget {
  const LipidPage({Key? key}) : super(key: key);

  @override
  State<LipidPage> createState() => _LipidState();
}

class _LipidState extends State<LipidPage> {
  final getHealthBloc = sl<GetHealthBloc>();
  late ProfileProvider profileProvider;
  bool isError = false;
  void isLoading() async {
    profileProvider = ProfileProvider.of(context, listen: false);
    await profileProvider.getProfileData().then((value) => isError = value);
  }

  @override
  void initState() {
    super.initState();
    isLoading();
    getHealthBloc
        .add(GetHealthDataEvent(id: profileProvider.profileData.idEmployees!));
  }

  String dropdownvalue = '2566';
  var items = [
    '2560',
    '2561',
    '2562',
    '2563',
    '2564',
    '2565',
    '2566',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Column(
            children: [
              AppBarCustom2(
                  title: 'ผลการตรวจไขมันในเลือด',
                  imgPath: 'assets/images/Group 721.png',
                  showBackButton: true),
              // RedbloodList(),
              Container(
                child: BlocProvider(
                  create: (context) => getHealthBloc,
                  child: BlocBuilder<GetHealthBloc, GetHealthState>(
                    builder: (context, state) {
                      if (state is GetHealthInitial) {
                        return Text('errIni');
                      } else if (state is GetHealthLoading) {
                        return CircularProgressIndicator();
                      } else if (state is GetHealthFailure) {
                        return Text('failure');
                      } else if (state is GetHealthSuccess) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.getHealth.time!.length,
                            itemBuilder: (context, timeIndex) {
                              var time = state.getHealth.time![timeIndex];

                              for (var testResult in time.testResult!) {
                                if (testResult.category == 6) {
                                  return GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          2, // number of items in each row
                                      mainAxisSpacing:
                                          5.0, // spacing between rows
                                      crossAxisSpacing:
                                          2.0, // spacing between columns
                                      childAspectRatio: 0.91,
                                    ),
                                    padding: EdgeInsets.all(8.0),
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: testResult.result!.length,
                                    itemBuilder: (context, resultIndex) {
                                      var result1 =
                                          testResult.result![resultIndex];

                                      return RedbloodLayout(
                                        imgPath:
                                            'assets/icons/health/${result1.icon}',
                                        section: result1.section.toString(),
                                        value: result1.value.toString(),
                                        unit: result1.unit.toString(),
                                        standard: result1.standard.toString(),
                                        status: result1.status.toString(),
                                      );
                                    },
                                  );
                                }
                              }

                              return Container(); // หรือ return null; ตามต้องการ
                            },
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
