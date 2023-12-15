// To parse this JSON data, do
//
//     final getInsurance = getInsuranceFromJson(jsonString);

import 'dart:convert';

import 'package:ant_project/src/features/user/insurance/domain/entity/insurance_entity.dart';

List<GetInsuranceModel> insuranceListFromJson(String str) =>
    List<GetInsuranceModel>.from(
        json.decode(str).map((x) => GetInsuranceModel.fromJson(x)));

String insuranceListToJson(List<GetInsuranceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetInsuranceModel extends InsuranceEntity {
  const GetInsuranceModel({
    required super.idInsurance,
    required super.name,
    required super.companyName,
    required super.detail,
    required super.idCategory,
    required super.protectionPeriod,
    required super.link,
    required super.price,
    required super.discount,
    required super.netPrice,
    required super.image,
    required super.idCompany,
    required super.createdBy,
    required super.createdDate,
    required super.categoryName,
    required super.protection,
  });

  factory GetInsuranceModel.fromJson(Map<String, dynamic> json) =>
      GetInsuranceModel(
        idInsurance: json["idInsurance"],
        name: json["name"],
        companyName: json["companyName"],
        detail: json["detail"],
        idCategory: json["idCategory"],
        protectionPeriod: json["protectionPeriod"],
        link: json["link"],
        price: json["price"],
        discount: json["discount"],
        netPrice: json["netPrice"],
        image: json["image"],
        idCompany: json["idCompany"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        categoryName: json["categoryName"],
        protection: json["protection"] == null
            ? []
            : List<ProtectionModel>.from(
                json["protection"]!.map((x) => ProtectionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "idInsurance": idInsurance,
        "name": name,
        "companyName": companyName,
        "detail": detail,
        "idCategory": idCategory,
        "protectionPeriod": protectionPeriod,
        "link": link,
        "price": price,
        "discount": discount,
        "netPrice": netPrice,
        "image": image,
        "idCompany": idCompany,
        "createdBy": createdBy,
        "createdDate": createdDate?.toIso8601String(),
        "categoryName": categoryName,
        "protection": protection == null
            ? []
            : List<dynamic>.from(protection!.map((x) => x.toJson())),
      };
}

class ProtectionModel extends Protection {
  ProtectionModel({
    required super.name,
    required super.condition,
    required super.idProtection,
  });

  factory ProtectionModel.fromJson(Map<String, dynamic> json) =>
      ProtectionModel(
        name: json["name"],
        condition: json["condition"],
        idProtection: json["idProtection"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "condition": condition,
        "idProtection": idProtection,
      };
}
