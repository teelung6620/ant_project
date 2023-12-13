import 'package:ant_project/src/features/user/home/data/model/get_profile_model.dart';
import 'package:equatable/equatable.dart';

class HospitalEntity extends Equatable {
  final int? id;
  final String? name;
  final String? detail;
  final double? lat;
  final double? lng;
  final String? location;
  final double? rating;
  final String? phone;
  final String? image;
  final String? link;
  final List<String>? services;

  const HospitalEntity({
    this.id,
    this.name,
    this.detail,
    this.lat,
    this.lng,
    this.location,
    this.rating,
    this.phone,
    this.image,
    this.link,
    this.services,
  });
  @override
  List<Object?> get props => [
        id,
        name,
        detail,
        lat,
        lng,
        location,
        rating,
        phone,
        image,
        link,
        services,
      ];
}
