import 'package:ant_project/src/features/user/redeem_history/presentations/pages/flexpoint_history_page.dart';
import 'package:ant_project/src/features/user/health_check/presentations/pages/health_check_page.dart';
import 'package:ant_project/src/features/user/insurance/presentations/pages/insurance_page.dart';
import 'package:ant_project/src/features/user/profile/presentations/pages/flexpoint_bag.dart';
import 'package:ant_project/src/features/user/profile/presentations/widget/circle_icon2.dart';
import 'package:ant_project/src/features/user/treatment_history/presentations/pages/medical_treatment_page.dart';
import 'package:ant_project/presentation/pages/my_guarantee_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CircleLayout extends StatelessWidget {
  const CircleLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CircleIcon(
                title: 'กระเป๋า\nFlexpoint',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Durations.medium3,
                        type: PageTransitionType.rightToLeft,
                        child: FlexpointBagPage()),
                  );
                },
              ),
              CircleIcon(
                title: 'ประวัติการรักษา',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Durations.medium3,
                        type: PageTransitionType.rightToLeft,
                        child: MedicalTreatmentPage()),
                  );
                },
              )
            ],
          ),
          Column(
            children: [
              CircleIcon(
                title: 'แลก\nFlexpoint',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {},
              ),
              CircleIcon(
                title: 'Dashboard',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {},
              ),
            ],
          ),
          Column(
            children: [
              CircleIcon(
                title: 'ประวัติการแลก\nFlexpoint',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Durations.medium3,
                        type: PageTransitionType.rightToLeft,
                        child: FlexpointHistoryPage()),
                  );
                },
              ),
              CircleIcon(
                title: 'ผลสุขภาพ',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {},
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleIcon(
                title: 'สิทธิของฉัน',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {},
              ),
              CircleIcon(
                title: 'แพ็คเกจ\nตรวจสุขภาพ',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Durations.medium3,
                        type: PageTransitionType.rightToLeft,
                        child: const HealthCheckPage()),
                  );
                },
              ),
            ],
          ),
          Column(
            children: [
              CircleIcon(
                title: 'ซื้อประกัน',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Durations.medium3,
                        type: PageTransitionType.rightToLeft,
                        child: const InsurancePage()),
                  );
                },
              ),
              CircleIcon(
                title: 'Certificate\nสุขภาพ',
                imgPath: 'assets/images/pink_mileage.png',
                onTap: () {},
              ),
            ],
          ),
          CircleIcon(
            title: 'ประกันของฉัน',
            imgPath: 'assets/images/pink_mileage.png',
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                    duration: Durations.medium3,
                    type: PageTransitionType.rightToLeft,
                    child: const MyGuaranteePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
