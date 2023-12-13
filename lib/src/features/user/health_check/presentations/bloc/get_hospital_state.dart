part of 'get_hospital_bloc.dart';

abstract class GetHospitalState extends Equatable {
  const GetHospitalState();

  @override
  List<Object> get props => [];
}

final class GetHospitalInitial extends GetHospitalState {
  @override
  List<Object> get props => [];
}

final class GetHospitalLoading extends GetHospitalState {
  @override
  List<Object> get props => [];
}

final class GetHospitalFailure extends GetHospitalState {
  final Failure error;

  GetHospitalFailure({required this.error});
  @override
  List<Object> get props => [];
}

final class GetHospitalSuccess extends GetHospitalState {
  final List<HospitalEntity> getHospital;

  GetHospitalSuccess({required this.getHospital});
  @override
  List<Object> get props => [];
}
