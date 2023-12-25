// To parse this JSON data, do
//
//     final getItemModel = getItemModelFromJson(jsonString);

import 'dart:convert';

import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/redeem_entity.dart';

RedeemModel redeemModelFromJson(String str) =>
    RedeemModel.fromJson(json.decode(str));

String redeemModelToJson(RedeemModel data) => json.encode(data.toJson());

class RedeemModel extends RedeemEntity {
  const RedeemModel({
    required super.idReward,
    required super.quantity,
    required super.idEmployee,
    required super.coins,
  });

  factory RedeemModel.fromJson(Map<String, dynamic> json) => RedeemModel(
        idReward: json["idReward"],
        idEmployee: json["idEmployee"],
        quantity: json["quantity"],
        coins: json["coins"] == null
            ? []
            : List<CoinReModel>.from(
                json["coins"]!.map((x) => CoinReModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "idReward": idReward,
        "idEmployee": idEmployee,
        "quantity": quantity,
        "coins": coins == null
            ? []
            : List<dynamic>.from(coins!.map((x) => x.toJson())),
      };
}

class CoinReModel extends CoinRe {
  CoinReModel({
    required super.amount,
  });

  factory CoinReModel.fromJson(Map<String, dynamic> json) => CoinReModel(
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
      };
}
