import 'dart:async';
import 'package:ant_project/src/components/home_page.dart';
import 'package:ant_project/src/components/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../storage/secure_storage.dart';
import '../login/presentation/pages/login_page.dart';

class LoadingPage extends StatefulWidget {
  final bool isLogIn;

  const LoadingPage({super.key, required this.isLogIn});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final Logger logger = Logger();
  startLoading() async {
    return Timer(const Duration(seconds: 2), () async {
      if (widget.isLogIn && await LoginStorage.readToken() != null) {
        String idRole = await LoginStorage.readIdRoles();
        if (idRole == "4" || idRole == "2") {
          idRole == "4"
              ? logger.i("Role : User")
              : logger.i("Role : User_Manager");
          Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.leftToRight, child: const HomePage()),
          );
        } else {
          logger.w("Role อื่นๆ: ยังไม่พร้อมใช้งาน");
          await QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              confirmBtnText: 'ย้อนกลับ',
              title: 'ยังไม่เปิดให้บริการ',
              text:
                  "สิทธิ์แอดมิน ยังไม่เปิดให้บริการใน Mobile App\n กรุณาใช้ผ่าน Website",
              confirmBtnColor: const Color(0xffE46A76),
              onConfirmBtnTap: () async {
                await LoginStorage.deleteAll();
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: const LoginPage()),
                );
              });
          await LoginStorage.deleteAll();
          Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.leftToRight, child: const LoginPage()),
          );
        }
      } else {
        await LoginStorage.deleteAll();
        Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.leftToRight, child: const LoginPage()),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startLoading();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              constraints: const BoxConstraints.expand(),
              child: Image.asset(
                'assets/images/splash.png',
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(child: Loading()),
            ),
          ],
        ),
      ),
    );
  }
}
