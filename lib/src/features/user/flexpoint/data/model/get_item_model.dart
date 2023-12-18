// To parse this JSON data, do
//
//     final getItemModel = getItemModelFromJson(jsonString);

import 'dart:convert';

import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';

List<GetItemModel> itemListFromJson(String str) => List<GetItemModel>.from(
    json.decode(str).map((x) => GetItemModel.fromJson(x)));

String itemListToJson(List<GetItemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetItemModel extends ItemEntity {
  GetItemModel({
    required super.idProduct,
    required super.name,
    required super.detail,
    required super.image,
    required super.idProductType,
    required super.items,
    required super.images,
    required super.options,
  });

  factory GetItemModel.fromJson(Map<String, dynamic> json) => GetItemModel(
        idProduct: json["idProduct"],
        name: json["name"],
        detail: json["detail"],
        image: json["image"],
        idProductType: json["idProductType"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => ItemModel.fromJson(x))),
        images: json["images"] == null
            ? []
            : List<Image>.from(
                json["images"]!.map((x) => ImageModel.fromJson(x))),
        options: json["options"] == null
            ? []
            : List<GetItemModelOptionModel>.from(json["options"]!
                .map((x) => GetItemModelOptionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "idProduct": idProduct,
        "name": name,
        "detail": detail,
        "image": image,
        "idProductType": idProductType,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}

class ImageModel extends Image {
  ImageModel({
    required super.idProductImage,
    required super.image,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        idProductImage: json["idProductImage"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "idProductImage": idProductImage,
        "image": image,
      };
}

class ItemModel extends Item {
  ItemModel({
    required super.idProductItem,
    required super.sku,
    required super.image,
    required super.active,
    required super.idProductGroup,
    required super.idReward,
    required super.quantity,
    required super.price,
    required super.numberOfRedeem,
    required super.coins,
    required super.options,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        idProductItem: json["idProductItem"],
        sku: json["sku"],
        image: json["image"],
        active: json["active"],
        idProductGroup: json["idProductGroup"],
        idReward: json["idReward"],
        quantity: json["quantity"],
        price: json["price"],
        numberOfRedeem: json["numberOfRedeem"],
        coins: json["coins"] == null
            ? []
            : List<Coin>.from(json["coins"]!.map((x) => CoinModel.fromJson(x))),
        options: json["options"] == null
            ? []
            : List<ItemOption>.from(
                json["options"]!.map((x) => ItemOptionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "idProductItem": idProductItem,
        "sku": sku,
        "image": image,
        "active": active,
        "idProductGroup": idProductGroup,
        "idReward": idReward,
        "quantity": quantity,
        "price": price,
        "numberOfRedeem": numberOfRedeem,
        "coins": coins == null
            ? []
            : List<dynamic>.from(coins!.map((x) => x.toJson())),
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}

class CoinModel extends Coin {
  int? amount;

  CoinModel({
    this.amount,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
      };
}

class ItemOptionModel extends ItemOption {
  ItemOptionModel({
    required super.idVariationOption,
    required super.value,
    required super.idVariation,
  });

  factory ItemOptionModel.fromJson(Map<String, dynamic> json) =>
      ItemOptionModel(
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

class GetItemModelOptionModel extends GetItemModelOption {
  GetItemModelOptionModel({
    required super.idVariation,
    required super.name,
    required super.option,
  });

  factory GetItemModelOptionModel.fromJson(Map<String, dynamic> json) =>
      GetItemModelOptionModel(
        idVariation: json["idVariation"],
        name: json["name"],
        option: json["option"] == null
            ? []
            : List<OptionOptionModel>.from(
                json["option"]!.map((x) => OptionOptionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "idVariation": idVariation,
        "name": name,
        "option": option == null
            ? []
            : List<dynamic>.from(option!.map((x) => x.toJson())),
      };
}

class OptionOptionModel extends OptionOption {
  OptionOptionModel({
    required super.idVariationOption,
    required super.value,
  });

  factory OptionOptionModel.fromJson(Map<String, dynamic> json) =>
      OptionOptionModel(
        idVariationOption: json["idVariationOption"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "idVariationOption": idVariationOption,
        "value": value,
      };
}
