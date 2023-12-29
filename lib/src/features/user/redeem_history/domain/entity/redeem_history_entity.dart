import 'package:equatable/equatable.dart';

class RedeemHistoryEntity extends Equatable {
  final int? idRedeem;
  final DateTime? redeemDate;
  final int? idRedeemStatus;
  final DateTime? receivedDate;
  final int? idReward;
  final int? idProductItem;
  final dynamic idCompanyProductItem;
  final int? idProduct;
  final dynamic idCompanyProduct;
  final String? name;
  final String? detail;
  final String? image;
  final List<Option>? options;
  final List<Coin>? coins;

  const RedeemHistoryEntity({
    this.idRedeem,
    this.redeemDate,
    this.idRedeemStatus,
    this.receivedDate,
    this.idReward,
    this.idProductItem,
    this.idCompanyProductItem,
    this.idProduct,
    this.idCompanyProduct,
    this.name,
    this.detail,
    this.image,
    this.options,
    this.coins,
  });
  @override
  List<Object?> get props => [
        idRedeem,
        redeemDate,
        idRedeemStatus,
        receivedDate,
        idReward,
        idProductItem,
        idCompanyProductItem,
        idProduct,
        idCompanyProduct,
        name,
        detail,
        image,
        options,
        coins,
      ];
}

class Coin {
  int? amount;

  Coin({
    this.amount,
  });
  toJson() {}
}

class Option {
  int? idVariationOption;
  String? value;
  int? idVariation;

  Option({
    this.idVariationOption,
    this.value,
    this.idVariation,
  });
  toJson() {}
}
