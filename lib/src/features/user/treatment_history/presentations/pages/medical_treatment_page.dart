import 'package:ant_project/injection_container.dart';
import 'package:ant_project/presentation/widget/AppBarCustom.dart';
import 'package:ant_project/presentation/widget/AppBarCustom2.dart';
import 'package:ant_project/presentation/widget/employee.dart';
import 'package:ant_project/presentation/widget/employee_layout.dart';
import 'package:ant_project/presentation/widget/privileges_2.dart';
import 'package:ant_project/presentation/widget/silver_appbar.dart';
import 'package:ant_project/presentation/widget/silver_appbar_tabbar.dart';
import 'package:ant_project/presentation/widget/total_credit.dart';
import 'package:ant_project/src/core/constant/network_api.dart';
import 'package:ant_project/src/features/user/treatment_history/presentations/bloc/get_treatment_bloc.dart';
import 'package:ant_project/src/features/user/treatment_history/presentations/widget/medical_treatment.dart';
import 'package:ant_project/src/features/user/treatment_history/presentations/widget/medical_treatment_layout.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconamoon/iconamoon.dart';
import 'package:intl/intl.dart';

class MedicalTreatmentPage extends StatefulWidget {
  const MedicalTreatmentPage({Key? key}) : super(key: key);

  @override
  State<MedicalTreatmentPage> createState() => _MedicalTreatmentState();
}

class _MedicalTreatmentState extends State<MedicalTreatmentPage> {
  final getTreatmentBloc = sl<GetTreatmentBloc>();

  @override
  void initState() {
    super.initState();
    getTreatmentBloc.add(GetTreatmentDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    // double rightValue = MediaQuery.of(context).size.width * 0.03;
    // double bottomValue = MediaQuery.of(context).size.width * 0.1;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: BlocProvider(
            create: (context) => getTreatmentBloc,
            child: Column(
              children: [
                const AppBarCustom2(
                  title: 'ประวัติการรักษา',
                  imgPath: 'assets/images/Group 721.png',
                  showBackButton: true,
                ),
                BlocBuilder<GetTreatmentBloc, GetTreatmentState>(
                  builder: (context, state) {
                    if (state is GetTreatmentInitial) {
                      return Text('errIni');
                    } else if (state is GetTreatmentLoading) {
                      return CircularProgressIndicator(
                        color: Colors.pink[100],
                      );
                    } else if (state is GetTreatmentFailure) {
                      return Text('failure');
                    } else if (state is GetTreatmentSuccess) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 2.75,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.getTreatment.treatment!.length,
                          itemBuilder: (context, index) {
                            // Parse the string date to DateTime
                            DateTime date = DateTime.parse(state
                                .getTreatment.treatment![index].dete
                                .toString());

                            // Format the date using DateFormat
                            String formattedDate =
                                DateFormat('dd/MM/yyyy').format(date);

                            return MedicalTreatment(
                                imgPath:
                                    'assets/icons/health/Treatment-Report/${state.getTreatment.treatment![index].icon}',
                                category: state
                                    .getTreatment.treatment![index].category
                                    .toString(),
                                title: state
                                    .getTreatment.treatment![index].section,
                                location: state
                                    .getTreatment.treatment![index].location,
                                date: formattedDate,
                                totalPrice: state
                                    .getTreatment.treatment![index].expenses
                                    .toString(),
                                onTap: () {});
                          },
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
