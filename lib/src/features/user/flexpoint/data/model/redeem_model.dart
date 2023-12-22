// To parse this JSON data, do
//
//     final getItemModel = getItemModelFromJson(jsonString);

import 'dart:convert';

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
  });

  factory RedeemModel.fromJson(Map<String, dynamic> json) => RedeemModel(
        idReward: json["idReward"],
        quantity: json["quantity"],
        idEmployee: json["idEmployees"],
      );

  Map<String, dynamic> toJson() => {
        "idReward": idReward,
        "quantity": quantity,
        "idEmployee": idEmployee,
      };
}
