import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  final int? id;
  final String? name;
  final int? quantity;
  final String? detail;
  final int? category;
  final int? price;
  final int? discount;
  final int? newPrice;
  final String? brand;
  final int? skuCode;
  final int? warranty;
  final String? warrantyDetail;
  final int? deliveryType;
  final int? deliveryTime;
  final int? deliveryCost;
  final List<String>? image;
  final String? type;
  final int? count;

  const ItemEntity({
    this.id,
    this.name,
    this.quantity,
    this.detail,
    this.category,
    this.price,
    this.discount,
    this.newPrice,
    this.brand,
    this.skuCode,
    this.warranty,
    this.warrantyDetail,
    this.deliveryType,
    this.deliveryTime,
    this.deliveryCost,
    this.image,
    this.type,
    this.count,
  });
  @override
  List<Object?> get props => [
        id,
        name,
        quantity,
        detail,
        category,
        price,
        discount,
        newPrice,
        brand,
        skuCode,
        warranty,
        warrantyDetail,
        deliveryType,
        deliveryTime,
        deliveryCost,
        image,
        type,
        count,
      ];
}
