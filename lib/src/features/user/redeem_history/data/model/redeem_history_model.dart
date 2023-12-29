// To parse this JSON data, do
//
//     final redeemHistoryModel = redeemHistoryModelFromJson(jsonString);

import 'dart:convert';

import 'package:ant_project/src/features/user/redeem_history/domain/entity/redeem_history_entity.dart';

List<RedeemHistoryModel> redeemHistoryListFromJson(String str) =>
    List<RedeemHistoryModel>.from(
        json.decode(str).map((x) => RedeemHistoryModel.fromJson(x)));

String redeemHistoryListToJson(List<RedeemHistoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RedeemHistoryModel extends RedeemHistoryEntity {
  RedeemHistoryModel({
    required super.idRedeem,
    required super.redeemDate,
    required super.idRedeemStatus,
    required super.receivedDate,
    required super.idReward,
    required super.idProductItem,
    required super.idCompanyProductItem,
    required super.idProduct,
    required super.idCompanyProduct,
    required super.name,
    required super.detail,
    required super.image,
    required super.options,
    required super.coins,
  });

  factory RedeemHistoryModel.fromJson(Map<String, dynamic> json) =>
      RedeemHistoryModel(
        idRedeem: json["idRedeem"],
        redeemDate: json["redeemDate"] == null
            ? null
            : DateTime.parse(json["redeemDate"]),
        idRedeemStatus: json["idRedeemStatus"],
        receivedDate: json["receivedDate"] == null
            ? null
            : DateTime.parse(json["receivedDate"]),
        idReward: json["idReward"],
        idProductItem: json["idProductItem"],
        idCompanyProductItem: json["idCompanyProductItem"],
        idProduct: json["idProduct"],
        idCompanyProduct: json["idCompanyProduct"],
        name: json["name"],
        detail: json["detail"],
        image: json["image"],
        options: json["options"] == null
            ? []
            : List<OptionModel>.from(
                json["options"]!.map((x) => OptionModel.fromJson(x))),
        coins: json["coins"] == null
            ? []
            : List<CoinModel>.from(
                json["coins"]!.map((x) => CoinModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "idRedeem": idRedeem,
        "redeemDate": redeemDate?.toIso8601String(),
        "idRedeemStatus": idRedeemStatus,
        "receivedDate": receivedDate?.toIso8601String(),
        "idReward": idReward,
        "idProductItem": idProductItem,
        "idCompanyProductItem": idCompanyProductItem,
        "idProduct": idProduct,
        "idCompanyProduct": idCompanyProduct,
        "name": name,
        "detail": detail,
        "image": image,
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
        "coins": coins == null
            ? []
            : List<dynamic>.from(coins!.map((x) => x.toJson())),
      };
}

class CoinModel extends Coin {
  CoinModel({
    required super.amount,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
      };
}

class OptionModel extends Option {
  OptionModel({
    required super.idVariationOption,
    required super.value,
    required super.idVariation,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) => OptionModel(
        idVariationOption: json["idVariationOption"],
        value: json["value"],
        idVariation: json["idVariation"],
      );

  Map<String, dynamic> toJson() => {
        "idVariationOption": idVariationOption,
        "value": value,
        "idVariation": idVariation,
      };
}
