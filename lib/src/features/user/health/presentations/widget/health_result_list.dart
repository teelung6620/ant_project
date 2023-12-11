import 'package:ant_project/presentation/pages/flexpoint_bag.dart';
import 'package:ant_project/presentation/widget/circle_icon2.dart';
import 'package:ant_project/presentation/widget/employee.dart';
import 'package:ant_project/src/features/user/all_health_result/presentations/pages/redblood_page.dart';
import 'package:ant_project/src/features/user/all_health_result/presentations/pages/sugar_page.dart';
import 'package:ant_project/src/features/user/all_health_result/presentations/pages/whiteblood_page.dart';
import 'package:ant_project/src/features/user/health/presentations/widget/health_result.dart';
import 'package:flutter/material.dart';

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
                    MaterialPageRoute(
                        builder: (context) => const RedbloodPage()),
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
                    MaterialPageRoute(
                        builder: (context) => const WhitebloodPage()),
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
                    MaterialPageRoute(builder: (context) => const SugarPage()),
                  );
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.01,
              ),
              HealthResult(
                imgPath: 'assets/icons/health/kidney.svg',
                title: 'ผลตรวจสุขภาพ\nการทำงานของไต',
                onTap: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HealthResult(
                imgPath: 'assets/icons/health/liver.svg',
                title: 'ผลตรวจสุขภาพ\nการทำงานของตับ',
                onTap: () {},
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.01,
              ),
              HealthResult(
                imgPath: 'assets/icons/health/trans-fat.svg',
                title: '\nผลตรวจไขมันในเลือด',
                onTap: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HealthResult(
                imgPath: 'assets/icons/health/urine.svg',
                title: '\nผลตรวจปัสสาวะ',
                onTap: () {},
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.01,
              ),
              HealthResult(
                imgPath: 'assets/icons/health/addictiveSubstance.svg',
                title: '\nผลตรวจสารเสพติด',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
