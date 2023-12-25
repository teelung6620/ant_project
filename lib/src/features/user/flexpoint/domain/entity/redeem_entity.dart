import 'package:equatable/equatable.dart';

class RedeemEntity extends Equatable {
  final int? idReward;
  final int? quantity;
  final int? idEmployee;
  final List<CoinRe>? coins;

  const RedeemEntity({
    this.idReward,
    this.quantity,
    this.idEmployee,
    this.coins,
  });
  @override
  List<Object?> get props => [idReward, quantity, idEmployee, coins];
}

class CoinRe {
  final int? amount;

  CoinRe({
    this.amount,
  });
  toJson() {}
}
