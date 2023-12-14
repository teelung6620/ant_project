part of 'get_treatment_bloc.dart';

abstract class GetTreatmentState extends Equatable {
  const GetTreatmentState();

  @override
  List<Object> get props => [];
}

final class GetTreatmentInitial extends GetTreatmentState {
  @override
  List<Object> get props => [];
}

final class GetTreatmentLoading extends GetTreatmentState {
  @override
  List<Object> get props => [];
}

final class GetTreatmentFailure extends GetTreatmentState {
  final Failure error;

  const GetTreatmentFailure({required this.error});
  @override
  List<Object> get props => [];
}

final class GetTreatmentSuccess extends GetTreatmentState {
  final TreatmentEntity getTreatment;

  const GetTreatmentSuccess({required this.getTreatment});
  @override
  List<Object> get props => [];
}
