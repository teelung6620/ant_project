part of 'get_insurance_bloc.dart';

abstract class GetInsuranceState extends Equatable {
  const GetInsuranceState();

  @override
  List<Object> get props => [];
}

final class GetInsuranceInitial extends GetInsuranceState {
  @override
  List<Object> get props => [];
}

final class GetInsuranceLoading extends GetInsuranceState {
  @override
  List<Object> get props => [];
}

final class GetInsuranceFailure extends GetInsuranceState {
  final Failure error;

  GetInsuranceFailure({required this.error});
  @override
  List<Object> get props => [];
}

final class GetInsuranceSuccess extends GetInsuranceState {
  final List<InsuranceEntity> getInsurance;

  GetInsuranceSuccess({required this.getInsurance});
  @override
  List<Object> get props => [];
}
