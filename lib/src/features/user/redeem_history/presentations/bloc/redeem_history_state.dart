part of 'redeem_history_bloc.dart';

abstract class RedeemHistoryState extends Equatable {
  const RedeemHistoryState();

  @override
  List<Object> get props => [];
}

final class RedeemHistoryInitial extends RedeemHistoryState {
  @override
  List<Object> get props => [];
}

final class RedeemHistoryLoading extends RedeemHistoryState {
  @override
  List<Object> get props => [];
}

final class RedeemHistoryFailure extends RedeemHistoryState {
  final Failure error;

  RedeemHistoryFailure({required this.error});
  @override
  List<Object> get props => [];
}

final class RedeemHistorySuccess extends RedeemHistoryState {
  final List<RedeemHistoryEntity> getRedeem;

  RedeemHistorySuccess({required this.getRedeem});
  @override
  List<Object> get props => [];
}
