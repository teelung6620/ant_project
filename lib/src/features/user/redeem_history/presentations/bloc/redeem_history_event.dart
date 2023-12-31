part of 'redeem_history_bloc.dart';

abstract class RedeemHistoryEvent extends Equatable {
  const RedeemHistoryEvent();

  @override
  List<Object> get props => [];
}

class RedeemHistoryDataEvent extends RedeemHistoryEvent {
  final int idEmp;

  RedeemHistoryDataEvent({required this.idEmp});
  @override
  List<Object> get props => [idEmp];
}
