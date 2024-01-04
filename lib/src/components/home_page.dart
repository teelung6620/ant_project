import 'package:ant_project/button/bottom_navbar_provider.dart';
import 'package:ant_project/src/core/storage/secure_storage.dart';
import 'package:ant_project/src/features/user/flexpoint/presentations/pages/flexpoint_page.dart';
import 'package:ant_project/src/features/user/all_health_result/presentations/pages/health_page.dart';
import 'package:ant_project/presentation/pages/privileges_page.dart';
import 'package:ant_project/src/features/user/profile/presentations/pages/profile_page.dart';
import 'package:ant_project/src/features/user/profile/presentations/pages/first_page.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  final List<Widget> _pages = [
    const FirstPage(),
    const FlexpointPage(),
    const PrivilegesPage(),
    const HealthPage(),
    const ProfilePage(),
    //const FlexpointBagPage()
  ];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavIndex>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      resizeToAvoidBottomInset: false,
      extendBody: true, //Bug
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: navigationProvider.controller,
        onPageChanged: (index) {
          navigationProvider.setIndex(index);
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: const Color(0xFFFCB0C2),
        unselectedItemColor: const Color(0xFFFCB0C2),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (index) {
          navigationProvider.controller.jumpToPage(index);
          navigationProvider.setIndex(index);
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10), // Adjust padding as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: navigationProvider.currentIndex == 0
                    ? const Color(0xFFFCB0C2) // Selected color
                    : Colors.transparent, // Unselected color
              ),
              child: navigationProvider.currentIndex == 0
                  ? Icon(
                      FluentIcons.home_48_filled,
                      color: navigationProvider.currentIndex == 0
                          ? Colors.white
                          : null, // Icon color
                    )
                  : const Icon(FluentIcons.home_24_filled),
            ),
            label: 'หน้าแรก',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10), // Adjust padding as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: navigationProvider.currentIndex == 1
                    ? const Color(0xFFFCB0C2) // Selected color
                    : Colors.transparent, // Unselected color
              ),
              child: navigationProvider.currentIndex == 1
                  ? Icon(
                      MingCuteIcons.mgc_copper_coin_line,
                      color: navigationProvider.currentIndex == 1
                          ? Colors.white
                          : null, // Icon color
                    )
                  : const Icon(MingCuteIcons.mgc_copper_coin_line),
            ),
            label: 'flexpoint',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10), // Adjust padding as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: navigationProvider.currentIndex == 2
                    ? const Color(0xFFFCB0C2) // Selected color
                    : Colors.transparent, // Unselected color
              ),
              child: navigationProvider.currentIndex == 2
                  ? Icon(
                      FluentIcons.person_heart_20_regular,
                      color: navigationProvider.currentIndex == 2
                          ? Colors.white
                          : null, // Icon color
                    )
                  : const Icon(FluentIcons.person_heart_20_regular),
            ),
            label: 'สิทธิของฉัน',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10), // Adjust padding as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: navigationProvider.currentIndex == 3
                    ? const Color(0xFFFCB0C2)
                    : Colors.transparent, // Unselected color
              ),
              child: navigationProvider.currentIndex == 3
                  ? Icon(
                      FluentIcons.heart_circle_hint_48_filled,
                      color: navigationProvider.currentIndex == 3
                          ? Colors.white
                          : null, // Icon color
                    )
                  : const Icon(
                      FluentIcons.heart_circle_hint_48_filled,
                    ),
            ),
            label: 'สุขภาพ',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10), // Adjust padding as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: navigationProvider.currentIndex == 4
                    ? const Color(0xFFFCB0C2) // Selected color
                    : Colors.transparent, // Unselected color
              ),
              child: navigationProvider.currentIndex == 4
                  ? Icon(
                      Icons.account_circle_outlined,
                      color: navigationProvider.currentIndex == 4
                          ? Colors.white
                          : null, // Icon color
                    )
                  : const Icon(
                      Icons.account_circle_outlined,
                    ),
            ),
            label: 'โปรไฟล์',
          ),
        ],
        selectedIconTheme: const IconThemeData(
          size: 32.0, // ขนาดของ icon เมื่อถูกเลือก
        ),
        unselectedIconTheme: const IconThemeData(
          size: 24.0, // ขนาดของ icon เมื่อไม่ถูกเลือก
        ),
      ),
    );
  }
}
