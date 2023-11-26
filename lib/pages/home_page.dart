import 'package:ant_project/pages/first_page.dart';
import 'package:ant_project/pages/flexpoint_page.dart';
import 'package:ant_project/pages/health_page.dart';
import 'package:ant_project/pages/privilege_page.dart';
import 'package:ant_project/pages/profile_page.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:solar/solar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    FirstPage(),
    FlexpointPage(),
    PrivilegePage(),
    HealthPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: Color(0xFFFCB0C2),
        unselectedItemColor: Color(0xFFFCB0C2),
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(10), // Adjust padding as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _selectedIndex == 0
                    ? Color(0xFFFCB0C2) // Selected color
                    : Colors.transparent, // Unselected color
              ),
              child: _selectedIndex == 0
                  ? Icon(
                      FluentIcons.home_48_filled,
                      color: _selectedIndex == 0
                          ? Colors.white
                          : null, // Icon color
                    )
                  : Icon(FluentIcons.home_24_filled),
            ),
            label: 'หน้าแรก',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(10), // Adjust padding as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _selectedIndex == 1
                    ? Color(0xFFFCB0C2) // Selected color
                    : Colors.transparent, // Unselected color
              ),
              child: _selectedIndex == 1
                  ? Icon(
                      MingCuteIcons.mgc_copper_coin_line,
                      color: _selectedIndex == 1
                          ? Colors.white
                          : null, // Icon color
                    )
                  : Icon(MingCuteIcons.mgc_copper_coin_line),
            ),
            label: 'flexpoint',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(10), // Adjust padding as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _selectedIndex == 2
                    ? Color(0xFFFCB0C2) // Selected color
                    : Colors.transparent, // Unselected color
              ),
              child: _selectedIndex == 2
                  ? Icon(
                      FluentIcons.person_heart_20_regular,
                      color: _selectedIndex == 2
                          ? Colors.white
                          : null, // Icon color
                    )
                  : Icon(FluentIcons.person_heart_20_regular),
            ),
            label: 'สิทธิของฉัน',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(10), // Adjust padding as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _selectedIndex == 3
                    ? Color(0xFFFCB0C2)
                    : Colors.transparent, // Unselected color
              ),
              child: _selectedIndex == 3
                  ? Icon(
                      FluentIcons.heart_circle_hint_48_filled,
                      color: _selectedIndex == 3
                          ? Colors.white
                          : null, // Icon color
                    )
                  : Icon(
                      FluentIcons.heart_circle_hint_48_filled,
                    ),
            ),
            label: 'สุขภาพ',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(10), // Adjust padding as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _selectedIndex == 4
                    ? Color(0xFFFCB0C2) // Selected color
                    : Colors.transparent, // Unselected color
              ),
              child: _selectedIndex == 4
                  ? Icon(
                      Icons.account_circle_outlined,
                      color: _selectedIndex == 4
                          ? Colors.white
                          : null, // Icon color
                    )
                  : Icon(
                      Icons.account_circle_outlined,
                    ),
            ),
            label: 'โปรไฟล์',
          ),
        ],
        selectedIconTheme: IconThemeData(
          size: 32.0, // ขนาดของ icon เมื่อถูกเลือก
        ),
        unselectedIconTheme: IconThemeData(
          size: 24.0, // ขนาดของ icon เมื่อไม่ถูกเลือก
        ),
      ),
    );
  }
}
