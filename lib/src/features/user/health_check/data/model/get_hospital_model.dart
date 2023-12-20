import 'dart:convert';

import 'package:ant_project/src/features/user/health_check/domain/entity/hospital_entity.dart';

List<GetHospitalModel> hospitalListFromJson(String str) =>
    List<GetHospitalModel>.from(
        json.decode(str).map((x) => GetHospitalModel.fromJson(x)));

String hospitalListToJson(List<GetHospitalModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetHospitalModel extends HospitalEntity {
  GetHospitalModel({
    required super.id,
    required super.name,
    required super.detail,
    required super.lat,
    required super.lng,
    required super.location,
    required super.rating,
    required super.phone,
    required super.image,
    required super.link,
    required super.services,
  });

  factory GetHospitalModel.fromJson(Map<String, dynamic> json) =>
      GetHospitalModel(
        id: json["id"],
        name: json["name"],
        detail: json["detail"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        location: json["location"],
        rating: json["rating"]?.toDouble(),
        phone: json["phone"],
        image: json["image"],
        link: json["link"],
        services: json["services"] == null
            ? []
            : List<String>.from(json["services"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "detail": detail,
        "lat": lat,
        "lng": lng,
        "location": location,
        "rating": rating,
        "phone": phone,
        "image": image,
        "link": link,
        "services":
            services == null ? [] : List<dynamic>.from(services!.map((x) => x)),
      };
}
