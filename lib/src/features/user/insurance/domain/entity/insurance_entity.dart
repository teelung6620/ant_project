import 'package:equatable/equatable.dart';

class InsuranceEntity extends Equatable {
  final int? idInsurance;
  final String? name;
  final String? companyName;
  final String? detail;
  final int? idCategory;
  final int? protectionPeriod;
  final String? link;
  final int? price;
  final int? discount;
  final int? netPrice;
  final String? image;
  final int? idCompany;
  final int? createdBy;
  final DateTime? createdDate;
  final String? categoryName;
  final List<Protection>? protection;
  const InsuranceEntity({
    this.idInsurance,
    this.name,
    this.companyName,
    this.detail,
    this.idCategory,
    this.protectionPeriod,
    this.link,
    this.price,
    this.discount,
    this.netPrice,
    this.image,
    this.idCompany,
    this.createdBy,
    this.createdDate,
    this.categoryName,
    this.protection,
  });
  @override
  List<Object?> get props => [
        idInsurance,
        name,
        companyName,
        detail,
        idCategory,
        protectionPeriod,
        link,
        price,
        discount,
        netPrice,
        image,
        idCompany,
        createdBy,
        createdDate,
        categoryName,
        protection,
      ];
}

class Protection {
  final String? name;
  final String? condition;
  final int? idProtection;

  Protection({
    this.name,
    this.condition,
    this.idProtection,
  });
  toJson() {}
}
