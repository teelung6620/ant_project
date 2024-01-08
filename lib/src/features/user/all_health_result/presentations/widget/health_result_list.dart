import 'package:ant_project/presentation/widget/employee.dart';
import 'package:ant_project/src/features/user/all_health_result/presentations/pages/addictive_page.dart';
import 'package:ant_project/src/features/user/all_health_result/presentations/pages/kidney_page.dart';
import 'package:ant_project/src/features/user/all_health_result/presentations/pages/lipid_page.dart';
import 'package:ant_project/src/features/user/all_health_result/presentations/pages/liver_page.dart';
import 'package:ant_project/src/features/user/all_health_result/presentations/pages/redblood_page.dart';
import 'package:ant_project/src/features/user/all_health_result/presentations/pages/sugar_page.dart';
import 'package:ant_project/src/features/user/all_health_result/presentations/pages/urine_page.dart';
import 'package:ant_project/src/features/user/all_health_result/presentations/pages/whiteblood_page.dart';
import 'package:ant_project/src/features/user/all_health_result/presentations/widget/health_result.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HealthResultList extends StatelessWidget {
  const HealthResultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HealthResult(
                imgPath: 'assets/icons/health/red-blood-cells.svg',
                title: '\nผลตรวจเม็ดเลือดแดง',
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Durations.medium3,
                        type: PageTransitionType.rightToLeft,
                        child: const RedbloodPage()),
                  );
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.01,
              ),
              HealthResult(
                imgPath: 'assets/icons/health/white-blood-cell.svg',
                title: '\nผลตรวจเม็ดเลือดขาว',
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Durations.medium3,
                        type: PageTransitionType.rightToLeft,
                        child: const WhitebloodPage()),
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HealthResult(
                imgPath: 'assets/icons/health/sugar-blood-level.svg',
                title: 'ผลการตรวจระดับ\nกรดยูริก/น้ำตาล',
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Durations.medium3,
                        type: PageTransitionType.rightToLeft,
                        child: const SugarPage()),
                  );
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.01,
              ),
              HealthResult(
                imgPath: 'assets/icons/health/kidney.svg',
                title: 'ผลตรวจสุขภาพ\nการทำงานของไต',
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Durations.medium3,
                        type: PageTransitionType.rightToLeft,
                        child: const KidneyPage()),
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HealthResult(
                imgPath: 'assets/icons/health/liver.svg',
                title: 'ผลตรวจสุขภาพ\nการทำงานของตับ',
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Durations.medium3,
                        type: PageTransitionType.rightToLeft,
                        child: const LiverPage()),
                  );
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.01,
              ),
              HealthResult(
                imgPath: 'assets/icons/health/trans-fat.svg',
                title: '\nผลตรวจไขมันในเลือด',
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Durations.medium3,
                        type: PageTransitionType.rightToLeft,
                        child: const LipidPage()),
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HealthResult(
                imgPath: 'assets/icons/health/urine.svg',
                title: '\nผลตรวจปัสสาวะ',
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Durations.medium3,
                        type: PageTransitionType.rightToLeft,
                        child: const UrinePage()),
                  );
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.01,
              ),
              HealthResult(
                imgPath: 'assets/icons/health/addictiveSubstance.svg',
                title: '\nผลตรวจสารเสพติด',
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Durations.medium3,
                        type: PageTransitionType.rightToLeft,
                        child: const AddictivePage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
