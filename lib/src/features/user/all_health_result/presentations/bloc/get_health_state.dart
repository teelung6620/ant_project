part of 'get_health_bloc.dart';

abstract class GetHealthState extends Equatable {
  const GetHealthState();

  @override
  List<Object> get props => [];
}

final class GetHealthInitial extends GetHealthState {
  @override
  List<Object> get props => [];
}

final class GetHealthLoading extends GetHealthState {
  @override
  List<Object> get props => [];
}

final class GetHealthFailure extends GetHealthState {
  final Failure error;

  GetHealthFailure({required this.error});
  @override
  List<Object> get props => [];
}

final class GetHealthSuccess extends GetHealthState {
  final HealthEntity getHealth;

  GetHealthSuccess({required this.getHealth});
  @override
  List<Object> get props => [];
}
