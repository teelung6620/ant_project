import 'package:equatable/equatable.dart';

class RedeemEntity extends Equatable {
  final int? idReward;
  final int? quantity;
  final int? idEmployee;

  const RedeemEntity({
    this.idReward,
    this.quantity,
    this.idEmployee,
  });
  @override
  List<Object?> get props => [idReward, quantity, idEmployee];
}
