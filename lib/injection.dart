import 'package:ant_project/button/bottom_navbar_provider.dart';
import 'package:ant_project/src/core/features/user/data/datasource/remote/profile_remote_data_source.dart';
import 'package:ant_project/src/core/features/user/data/repository/profile_repository_impl.dart';
import 'package:ant_project/src/core/features/user/domain/usecase/get_profile.dart';
import 'package:ant_project/src/core/features/user/presentation/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
// import 'package:unihr/src/features/user/gps/presentation/provider/switch_mode.dart';

class Injection extends StatelessWidget {
  final Widget? router;
  const Injection({super.key, this.router});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => NavIndex()),
          // ChangeNotifierProvider(create: (context) => RadioButtonProvider()),
          // ChangeNotifierProvider(
          //     create: (context) => ManagerRadioButtonProvider()),
          // ChangeNotifierProvider(create: (context) => SwitchModeProvider()),

          // * Profile
          ChangeNotifierProvider(
              create: (context) => ProfileProvider(
                  getProfile: GetProfile(
                      repository: ProfileRepositoryImpl(
                          remoteDataSource: ProfileRemoteDataSourceImpl(
                              client: http.Client()))))),
        ],
        child: router,
      );
}
