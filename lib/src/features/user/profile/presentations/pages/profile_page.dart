import 'package:ant_project/injection_container.dart';
import 'package:ant_project/presentation/widget/text_header.dart';
import 'package:ant_project/src/components/widget/loading.dart';
import 'package:ant_project/src/core/features/loading_page/loading_page.dart';

import 'package:ant_project/src/core/features/user/presentation/provider/profile_provider.dart';
import 'package:ant_project/src/features/user/profile/presentations/bloc/get_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  final getProfileBloc = sl<GetProfileBloc>();
  late ProfileProvider profileProvider;
  bool isError = false;
  void isLoading() async {
    profileProvider = ProfileProvider.of(context, listen: false);
    await profileProvider.getProfileData().then((value) => isError = value);
  }

  @override
  void initState() {
    super.initState();
    isLoading();
    getProfileBloc.add(GetProfileDataEvent());
  }

  // performLogout(BuildContext context) {
  //   final navigationProvider = Provider.of<NavIndex>(context, listen: false);
  //   navigationProvider.setIndex(0);
  //   Navigator.pushReplacement(
  //       context,
  //       PageTransition(
  //           type: PageTransitionType.leftToRight,
  //           child: const LoadingPage(
  //             isLogIn: false,
  //           )));
  // }

  // Future<bool> onLogOut() async {
  //   return await showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           backgroundColor: Colors.white,
  //           shape: RoundedRectangleBorder(
  //             borderRadius:
  //                 BorderRadius.circular(5), // Adjust the radius as needed
  //           ),
  //           title: Center(
  //               child: Column(
  //             children: [
  //               Icon(
  //                 Icons.logout,
  //                 color: Color(0xFFF15E5E),
  //                 size: 60,
  //               ),
  //               Text(
  //                 'logout',
  //                 style: TextStyle(color: const Color(0xff75838F)),
  //               ),
  //             ],
  //           )),
  //           content: Text(
  //             'wantlogout',
  //             style: TextStyle(
  //               fontSize: 15,
  //             ),
  //             textAlign: TextAlign.center,
  //           ),
  //           actions: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 TextButton(
  //                   child: Text('cancel',
  //                       style: TextStyle(color: const Color(0xffA5AFBA))),
  //                   onPressed: () {
  //                     Navigator.of(context).pop(false);
  //                   },
  //                 ),
  //                 TextButton(
  //                   style: ButtonStyle(
  //                       backgroundColor:
  //                           MaterialStateProperty.all(const Color(0xFFF15E5E)),
  //                       shape:
  //                           MaterialStateProperty.all<RoundedRectangleBorder>(
  //                         RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(
  //                               10.0), // Adjust the radius here
  //                         ),
  //                       )),
  //                   child:
  //                       Text('confirm', style: TextStyle(color: Colors.white)),
  //                   onPressed: () => performLogout(context),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ) ??
  //       false;
  // }

  @override
  Widget build(BuildContext context) {
    //final profileProvider = Provider.of<ProfileProvider>(context, listen: true);
    final providerData = Provider.of<ProfileProvider>(context, listen: true);

    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          child: Column(
            children: [
              Text(
                providerData.profileData.idCompany.toString(),
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoadingPage(
                              isLogIn: false,
                            )),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'logout',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //     BlocProvider(
      //   create: (context) => getProfileBloc,
      //   child: SingleChildScrollView(
      //       child: Column(
      //     children: [
      //       Container(
      //         width: MediaQuery.of(context).size.width * 0.5,
      //         child: BlocBuilder<GetProfileBloc, GetProfileState>(
      //           builder: (context, state) {
      //             if (state is GetProfileInitial) {
      //               return Text('errIni');
      //             } else if (state is GetProfileLoading) {
      //               return CircularProgressIndicator();
      //             } else if (state is GetProfileFailure) {
      //               return Text('failure');
      //             } else if (state is GetProfileSuccess) {
      //               return TextHeader(
      //                 title: 'Hi, ${state.getProfile.firstnameTh}',
      //               );
      //             }
      //             return Container();
      //           },
      //         ),
      //       ),
      //     ],
      //   )),
      // ),
    );
  }
}
