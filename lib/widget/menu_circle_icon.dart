// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// //import 'package:unihr/src/features/user/time_management/presentation/pages/time_management_page.dart';
// // import 'package:unihr/src/features/user/working_record/presentation/pages/work_record_page.dart';
// // import '../../../../../core/features/profile/user/presentation/provider/profile_provider.dart';
// // import '../../../../manager/employees_list/presentation/pages/employees_list_page.dart';
// // import '../../../../manager/overview/presentation/pages/overview_main_page.dart';
// // import '../../../../manager/waiting_status/presentation/pages/waiting_status.dart';
// // import '../../../../manager/working_time/presentation/pages/working_time_normal_page.dart';
// // import '../../../employee_network/presentation/pages/employee_network_page.dart';
// // import '../../../item_status/presentation/pages/item_status_page.dart';
// // import '../../../learning/presentation/pages/learning_page.dart';
// // import '../../../skill/presentation/pages/my_skills.dart';
// // import '../../../payslip/presentation/pages/payslip_page.dart';
// // import '../../../shift_ot/presentation/pages/shift_ot_page.dart';
// // import '../../../travelling/presentation/pages/travelling_page.dart';
// import 'circle_icon.dart';

// class MenuCircle extends StatelessWidget {
//   const MenuCircle({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //final ProfileProvider userData = Provider.of<ProfileProvider>(context);
//     return Column(
//       children: [
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.006,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             CircleIcons(
//               [
//                 "assets/icons/grey_profile.svg",
//                 "assets/icons/user_profile.svg"
//               ],
//               "ประวัติส่วนตัว",
//               page: null,
//               isDisable: false,
//               //isDisable: userData.isLoading,
//               index: 4,
//             ),
//             CircleIcons(
//               [
//                 "assets/icons/grey_work_time_table.svg",
//                 "assets/icons/work_time_table.svg"
//               ],
//               "ตารางเวลาทำงาน",
//               page: null,
//               isDisable: false,
//               index: 1,
//             ),
//             CircleIcons(
//               ["assets/icons/grey_leave.svg", "assets/icons/leave.svg"],
//               "ลางาน",
//               page: null,
//               isDisable: false,
//               index: 3,
//             ),
//             CircleIcons(
//               [
//                 "assets/icons/grey_list_status.svg",
//                 "assets/icons/list_status.svg"
//               ],
//               "สถานะรายการ",
//               page: null,
//               isDisable: false,
//               index: 0,
//             ),
//             CircleIcons(
//               [
//                 "assets/icons/grey_work_time_manage.svg",
//                 "assets/icons/work_time_manage.svg"
//               ],
//               "จัดการเวลาทำงาน",
//               page: null,
//               isDisable: false,
//               index: 0,
//             ),
//             CircleIconsWIthNull(
//               "บันทึกทำงาน",
//               page: null,
//               isDisable: false,
//               index: 0,
//               icons: Icons.work_history,
//             ),
//             CircleIconsWIthNull(
//               "My Skill",
//               page: null,
//               isDisable: false,
//               index: 0,
//               icons: Icons.menu_book_sharp,
//             ),
//           ],
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.03,
//         ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CircleIcons([
//               "assets/icons/grey_shift_ot.svg",
//               "assets/icons/shift_ot.svg"
//             ], "สรุปค่ากะและ OT", page: null, isDisable: false, index: 0),
//             CircleIcons([
//               "assets/icons/grey_payslip.svg",
//               "assets/icons/payslip.svg"
//             ], "สลิปเงินเดือน", page: null, isDisable: false, index: 0),
//             CircleIcons(
//               ["assets/icons/grey_learning.svg", "assets/icons/learning.svg"],
//               "อบรม",
//               page: null,
//               isDisable: false,
//               index: 0,
//             ),
//             CircleIcons([
//               "assets/icons/grey_my_paper.svg",
//               "assets/icons/my_paper.svg"
//             ], "เอกสารของฉัน", page: null, isDisable: true, index: 0),
//             CircleIcons([
//               "assets/icons/grey_travel.svg",
//               "assets/icons/travel.svg"
//             ], "บันทึกเดินทาง", page: null, isDisable: false, index: 0),
//             // CircleIconsWIthNull(
//             //   "ลงเวลา Bluetooth",
//             //   page: null,
//             //   isDisable: true,
//             //   index: 0,
//             //   icons: Icons.bluetooth_connected,
//             // ),
//             // CircleIconsWIthNull(
//             //   "Employee\nNetwork",
//             //   page: null,
//             //   isDisable: false,
//             //   index: 0,
//             //   icons: Icons.people,
//             // ),
//             // CircleIconsWIthNull(
//             //   "",
//             //   page: null,
//             //   isDisable: true,
//             //   index: 0,
//             //   icons: null,
//             // ),
//           ],
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//       ],
//     );
//   }
// }

// class MenuUserManagerCircle extends StatelessWidget {
//   const MenuUserManagerCircle({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.006,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             CircleIcons(
//               ["assets/icons/grey_overview.svg", "assets/icons/overview.svg"],
//               "มุมมองภาพรวม",
//               page: null,
//               isDisable: false,
//               index: 0,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.02,
//             ),
//             CircleIcons(
//               [
//                 "assets/icons/grey_profile.svg",
//                 "assets/icons/user_profile.svg"
//               ],
//               "พนักงาน",
//               page: null,
//               isDisable: false,
//               index: 0,
//             ),
//             const CircleIcons(
//               [
//                 "assets/icons/grey_work_time_table.svg",
//                 "assets/icons/work_time_table.svg"
//               ],
//               "เวลาทำงาน",
//               page: null,
//               isDisable: false,
//               index: 0,
//             ),
//             const CircleIcons([
//               "assets/icons/grey_wait_list.svg",
//               "assets/icons/wait_list.svg"
//             ], "รออนุมัติ", page: null, isDisable: false, index: 0),
//           ],
//         ),
//       ],
//     );
//   }
// }
