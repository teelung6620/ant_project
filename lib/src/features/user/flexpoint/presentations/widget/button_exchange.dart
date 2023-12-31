// import 'package:ant_project/injection_container.dart';
// import 'package:ant_project/src/core/constant/network_api.dart';
// import 'package:ant_project/src/core/features/user/presentation/provider/profile_provider.dart';
// import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
// import 'package:ant_project/src/features/user/flexpoint/domain/entity/redeem_entity.dart';
// import 'package:ant_project/src/features/user/flexpoint/presentations/bloc/get_item_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:confetti/confetti.dart';
// import 'package:http/http.dart' as http;
// import 'package:jwt_decoder/jwt_decoder.dart';

// class ButtonExchange extends StatefulWidget {
//   final String? imgPath;
//   final int quantity;
//   final int idReward;

//   final List<Item> colorStock;
//   final List<GetItemModelOption> color;
//   final List<GetItemModelOption> storage;
//   const ButtonExchange(
//       {required this.imgPath,
//       required this.quantity,
//       required this.idReward,
//       required this.color,
//       required this.colorStock,
//       required this.storage,
//       Key? key})
//       : super(key: key);

//   @override
//   _ButtonExchangeState createState() => _ButtonExchangeState();
// }

// class _ButtonExchangeState extends State<ButtonExchange> {
//   final controller = ConfettiController();
//   final getItemBloc = sl<GetItemBloc>();
//   int? idEmployees = 0;

//   int? idCompany = 0;

//   late ProfileProvider profileProvider;
//   bool isError = false;
//   void isLoading() async {
//     //TokenExpires.checkTokenExpires(context);
//     profileProvider = ProfileProvider.of(context, listen: false);
//     await profileProvider.getProfileData().then((value) => isError = value);
//   }

//   @override
//   void initState() {
//     super.initState();
//     //print('idEmployees = ${idEmployees}');
//     isLoading();
//     getItemBloc
//         .add(GetItemDataEvent(idCom: profileProvider.profileData.idCompany!));
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   Future<void> _showConfirmationDialog() async {
//     bool confirm = await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('ยืนยันการแลกของรางวัล'),
//           content: const Text('คุณต้องการลบแลกของรางวัลนี้ ใช่หรือไม่?'),
//           actions: <Widget>[
//             Center(
//               child: Column(
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(
//                           255, 255, 255, 255), // สีพื้นหลังของปุ่ม
//                       foregroundColor: Colors.black,
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).pop(false); // ยกเลิกการลบ
//                     },
//                     child: const Text(
//                       'ยกเลิก',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(
//                           255, 251, 111, 158), // สีพื้นหลังของปุ่ม
//                       foregroundColor: Colors.white,
//                     ),
//                     onPressed: () async {
//                       //getItemBloc.add(RedeemedDataEvent());
//                       Navigator.of(context).pop(true); // ยืนยันการลบ
//                       // getUser();

//                       getItemBloc.add(RedeemedDataEvent(
//                         idEmployee: profileProvider.profileData.idEmployees,
//                         //ค่าที่ส่ง quanity กับ idReward สลับกัน
//                         quantity: widget.idReward,
//                         idReward: widget.quantity,
//                         coins: [
//                           CoinRe(
//                               amount:
//                                   5), // แก้ตามโครงสร้างของข้อมูล Coins ที่คุณใช้
//                           // เพิ่ม Coins ตามต้องการ
//                         ],
//                       ));
//                       await _celebrate();
//                     },
//                     child: const Text('ยืนยัน'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _celebrate() async {
//     // await Future.delayed(const Duration(milliseconds: 1));
//     controller.play();

//     // Show AlertDialog after Confetti celebration
//     await showDialog(
//       context: context,
//       builder: (context) {
//         return Container(
//           height: MediaQuery.of(context).size.height,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.topCenter,
//                 child: ConfettiWidget(
//                   confettiController: controller,
//                   blastDirectionality: BlastDirectionality.explosive,
//                   // blastDirection: 3.14, // หรือใช้ 180 ก็ได้
//                   // shouldLoop: true,
//                   // emissionFrequency: 1,
//                   numberOfParticles: 200,
//                   gravity: 0.2,
//                   colors: const [
//                     Colors.green,
//                     Colors.blue,
//                     Colors.pink,
//                     Colors.orange
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.25,
//               ),
//               AlertDialog(
//                 title:
//                     // Image.asset(
//                     //   'assets/images/Rectangle 90.png',
//                     //   fit: BoxFit.cover,
//                     // ),

//                     Column(
//                   children: [
//                     Row(
//                       children: [
//                         Spacer(),
//                         IconButton(
//                           onPressed: () {
//                             Navigator.of(context)
//                                 .pop(); // Close the AlertDialog
//                           },
//                           icon: const Icon(Icons.close),
//                         ),
//                       ],
//                     ),
//                     Image.network(
//                       widget.imgPath
//                           .toString(), // เปลี่ยนเป็น path ของรูปที่คุณต้องการใช้
//                       width: 100, // ปรับขนาดตามที่ต้องการ
//                       height: 100,
//                     ),

//                     const SizedBox(height: 16), // ระยะห่างระหว่างรูปกับข้อความ
//                     const Text('สำเร็จ!'),
//                   ],
//                 ),
//                 content: const Text('คุณได้ทำการแลกของรางวัลเรียบร้อยแล้ว!'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//     // await Future.delayed(const Duration(seconds: 1));
//     //Navigator.pop(context);
//     controller.stop();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//               minimumSize: const Size(double.infinity, 50),
//               backgroundColor: const Color.fromARGB(255, 251, 111, 158),
//               foregroundColor: Colors.white),
//           onPressed: () async {
//             //print('idReward:${widget.idReward}');

//             // getItemBloc.add(RedeemedDataEvent(
//             //   idEmployee: idEmployees,
//             //   idReward: widget.idReward,
//             //   quantity: widget.quantity,
//             //   coins: [
//             //     CoinRe(amount: 5), // แก้ตามโครงสร้างของข้อมูล Coins ที่คุณใช้
//             //     // เพิ่ม Coins ตามต้องการ
//             //   ],s
//             // ));
//             await _showConfirmationDialog();
//           },
//           child: const Text(
//             'แลกของรางวัล',
//             style: TextStyle(color: Colors.white, fontSize: 25),
//           ),
//         ),
//       ],
//     );
//   }
// }
