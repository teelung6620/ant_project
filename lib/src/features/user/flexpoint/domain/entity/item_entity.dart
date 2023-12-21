import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  final int? idProduct;
  final String? name;
  final String? detail;
  final String? image;
  final int? idProductType;
  final List<Item>? items;
  final List<ImageE>? images;
  final List<GetItemModelOption>? options;

  const ItemEntity({
    this.idProduct,
    this.name,
    this.detail,
    this.image,
    this.idProductType,
    this.items,
    this.images,
    this.options,
  });
  @override
  List<Object?> get props => [
        idProduct,
        name,
        detail,
        image,
        idProductType,
        items,
        images,
        options,
      ];
}

class ImageE {
  final int? idProductImage;
  final String? image;

  ImageE({
    this.idProductImage,
    this.image,
  });
  toJson() {}
}

class Item {
  final int? idProductItem;
  final String? sku;
  final String? image;
  final int? active;
  final int? idProductGroup;
  final int? idReward;
  final int? quantity;
  final int? price;
  final int? numberOfRedeem;
  final List<Coin>? coins;
  final List<ItemOption>? options;

  Item({
    this.idProductItem,
    this.sku,
    this.image,
    this.active,
    this.idProductGroup,
    this.idReward,
    this.quantity,
    this.price,
    this.numberOfRedeem,
    this.coins,
    this.options,
  });
  toJson() {}
}

class Coin {
  final int? amount;

  Coin({
    this.amount,
  });
  toJson() {}
}

class ItemOption {
  final int? idVariationOption;
  final String? value;
  final int? idVariation;

  ItemOption({
    this.idVariationOption,
    this.value,
    this.idVariation,
  });
  toJson() {}
}

class GetItemModelOption {
  final int? idVariation;
  final String? name;
  final List<OptionOption>? option;

  GetItemModelOption({
    this.idVariation,
    this.name,
    this.option,
  });
  toJson() {}
}

class OptionOption {
  final int? idVariationOption;
  final String? value;

  OptionOption({
    this.idVariationOption,
    this.value,
  });

  toJson() {}
}
