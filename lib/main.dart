import 'package:ant_project/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(const MyApp(
      // token: prefs.getString('token'),
      ));
}

class MyApp extends StatelessWidget {
  // final token;
  const MyApp({
    // @required this.token,
    Key? key,
  }) : super(key: key);

  // bool isAdmin(String token) {
  //   final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
  //   final userType = decodedToken['user_type'];
  //   print(userType);
  //   return userType == 'admin';
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'kanit',
        cardTheme: const CardTheme(color: Colors.white),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        dialogTheme: const DialogTheme(backgroundColor: Colors.white),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        tabBarTheme: const TabBarTheme(dividerColor: Colors.transparent),
        useMaterial3: true,
        // colorScheme: ColorScheme.light(primary: Colors.white)
      ),
      home: const HomePage(),
    );
  }
}

// auth/auth_screen.dart

