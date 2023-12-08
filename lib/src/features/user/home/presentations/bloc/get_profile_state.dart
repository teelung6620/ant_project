part of 'get_profile_bloc.dart';

abstract class GetProfileState extends Equatable {
  const GetProfileState();
}

class GetProfileInitial extends GetProfileState {
  @override
  List<Object> get props => [];
}

class GetProfileLoading extends GetProfileState {
  @override
  List<Object> get props => [];
}

class GetProfileFailure extends GetProfileState {
  final Failure error;

  GetProfileFailure({required this.error});

  @override
  List<Object> get props => [];
}

class GetProfileSuccess extends GetProfileState {
  final ProfileEntityTest getProfile;

  GetProfileSuccess({required this.getProfile});

  @override
  List<Object> get props => [getProfile];
}
