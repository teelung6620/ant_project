import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/profile/domain/entity/profile_entity_test.dart';
import 'package:ant_project/src/features/user/profile/domain/usecase/get_profile.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_profile_event.dart';
part 'get_profile_state.dart';

class GetProfileBloc extends Bloc<ProfileEvent, GetProfileState> {
  final GetProfile getProfile;
  GetProfileBloc({required this.getProfile}) : super(GetProfileInitial()) {
    on<GetProfileDataEvent>((event, emit) async {
      emit(GetProfileLoading());
      var getprofile = await getProfile();
      getprofile.fold((l) => emit(GetProfileFailure(error: l)),
          (r) => emit(GetProfileSuccess(getProfile: r)));
    });
  }
}
