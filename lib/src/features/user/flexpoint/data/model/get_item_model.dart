import 'dart:convert';

import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';

List<GetItemModel> itemListFromJson(String str) => List<GetItemModel>.from(
    json.decode(str).map((x) => GetItemModel.fromJson(x)));

String itemListToJson(List<GetItemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetItemModel extends ItemEntity {
  GetItemModel({
    required int? id,
    required String? name,
    required int? quantity,
    required String? detail,
    required int? category,
    required int? price,
    required int? discount,
    required int? newPrice,
    required String? brand,
    required int? skuCode,
    required int? warranty,
    required String? warrantyDetail,
    required int? deliveryType,
    required int? deliveryTime,
    required int? deliveryCost,
    required List<String>? image,
    required String? type,
    required int? count,
  }) : super(
          id: id,
          name: name,
          quantity: quantity,
          detail: detail,
          category: category,
          price: price,
          discount: discount,
          newPrice: newPrice,
          brand: brand,
          skuCode: skuCode,
          warranty: warranty,
          warrantyDetail: warrantyDetail,
          deliveryType: deliveryType,
          deliveryTime: deliveryTime,
          deliveryCost: deliveryCost,
          image: image,
          type: type,
          count: count,
        );
  factory GetItemModel.fromJson(Map<String, dynamic> json) => GetItemModel(
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"],
        detail: json["detail"],
        category: json["category"],
        price: json["price"],
        discount: json["discount"],
        newPrice: json["newPrice"],
        brand: json["brand"],
        skuCode: json["skuCode"],
        warranty: json["warranty"],
        warrantyDetail: json["warrantyDetail"],
        deliveryType: json["deliveryType"],
        deliveryTime: json["deliveryTime"],
        deliveryCost: json["deliveryCost"],
        image: json["image"] == null
            ? []
            : List<String>.from(json["image"]!.map((x) => x)),
        type: json["type"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "quantity": quantity,
        "detail": detail,
        "category": category,
        "price": price,
        "discount": discount,
        "newPrice": newPrice,
        "brand": brand,
        "skuCode": skuCode,
        "warranty": warranty,
        "warrantyDetail": warrantyDetail,
        "deliveryType": deliveryType,
        "deliveryTime": deliveryTime,
        "deliveryCost": deliveryCost,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "type": type,
        "count": count,
      };
}
