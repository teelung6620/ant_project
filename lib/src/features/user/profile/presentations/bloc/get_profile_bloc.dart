import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/home/data/model/get_profile_model.dart';
import 'package:ant_project/src/features/user/home/domain/entity/profile_entity_test.dart';
import 'package:ant_project/src/features/user/home/domain/usecase/get_profile.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
