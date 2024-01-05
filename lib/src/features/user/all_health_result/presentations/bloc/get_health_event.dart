part of 'get_health_bloc.dart';

abstract class HealthEvent extends Equatable {
  const HealthEvent();

  @override
  List<Object> get props => [];
}

class GetHealthDataEvent extends HealthEvent {
  final int id;

  GetHealthDataEvent({required this.id});

  @override
  List<Object> get props => [id];
}
