import 'package:ant_project/injection_container.dart';
import 'package:ant_project/presentation/widget/text_header.dart';
import 'package:ant_project/src/features/user/profile/presentations/bloc/get_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  final getProfileBloc = sl<GetProfileBloc>();

  @override
  void initState() {
    super.initState();
    getProfileBloc.add(GetProfileDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getProfileBloc,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: BlocBuilder<GetProfileBloc, GetProfileState>(
                builder: (context, state) {
                  if (state is GetProfileInitial) {
                    return Text('errIni');
                  } else if (state is GetProfileLoading) {
                    return CircularProgressIndicator();
                  } else if (state is GetProfileFailure) {
                    return Text('failure');
                  } else if (state is GetProfileSuccess) {
                    return TextHeader(
                      title: 'Hi, ${state.getProfile.firstnameTh}',
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
