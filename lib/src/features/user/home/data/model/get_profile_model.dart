import 'dart:convert';

import 'package:ant_project/src/features/user/home/domain/entity/profile_entity_test.dart';

GetProfileModel userPostFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

String userPostToJson(GetProfileModel data) => json.encode(data.toJson());

class GetProfileModel extends ProfileEntityTest {
  GetProfileModel({
    required int? id,
    required String? username,
    required String? email,
    required String? password,
    required String? image,
    required String? firstname,
    required DateTime? lastname,
    required String? idDepartment,
    required String? department,
    required String? position,
    required String? type,
    required String? mobileNumber,
    required String? workingLocation,
    required String? province,
    required dynamic site,
    required String? status,
    required String? company,
    required List<int>? fovorite,
    required String? follower,
    required String? following,
    required List<String>? authorities,
    required List<int>? coachId,
    required String? rating,
    required String? profile,
    required String? experdence,
    required String? price,
    required List<EducationModel>? education,
    required String? esy,
    required int? tig,
    required int? div,
    required dynamic sect,
    required dynamic serviceY,
    required int? tip,
    required int? reportTo,
  }) : super(
          username: username,
          email: email,
          password: password,
          image: image,
          firstname: firstname,
          lastname: lastname,
          idDepartment: idDepartment,
          department: department,
          position: position,
          type: type,
          mobileNumber: mobileNumber,
          workingLocation: workingLocation,
          province: province,
          site: site,
          status: status,
          company: company,
          fovorite: fovorite,
          follower: follower,
          following: following,
          authorities: authorities,
          coachId: coachId,
          rating: rating,
          profile: profile,
          experdence: experdence,
          price: price,
          education: education,
          esy: esy,
          tig: tig,
          div: div,
          sect: sect,
          serviceY: serviceY,
          tip: tip,
          reportTo: reportTo,
        );
  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        image: json["image"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        idDepartment: json["idDepartment"],
        department: json["department"],
        position: json["position"],
        type: json["type"],
        mobileNumber: json["mobileNumber"],
        workingLocation: json["workingLocation"],
        province: json["province"],
        site: json["site"],
        status: json["status"],
        company: json["company"],
        fovorite: json["fovorite"] == null
            ? []
            : List<int>.from(json["fovorite"]!.map((x) => x)),
        follower: json["follower"],
        following: json["following"],
        authorities: json["authorities"] == null
            ? []
            : List<String>.from(json["authorities"]!.map((x) => x)),
        coachId: json["coachId"] == null
            ? []
            : List<int>.from(json["coachId"]!.map((x) => x)),
        rating: json["rating"]?.toDouble(),
        profile: json["profile"],
        experdence: json["experdence"],
        price: json["price"],
        education: json["education"] == null
            ? []
            : List<EducationModel>.from(
                json["education"]!.map((x) => EducationModel.fromJson(x))),
        esy: json["esy"],
        tig: json["tig"],
        div: json["div"],
        sect: json["sect"],
        serviceY: json["serviceY"],
        tip: json["tip"],
        reportTo: json["reportTo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "image": image,
        "firstname": firstname,
        "lastname": lastname,
        "idDepartment": idDepartment,
        "department": department,
        "position": position,
        "type": type,
        "mobileNumber": mobileNumber,
        "workingLocation": workingLocation,
        "province": province,
        "site": site,
        "status": status,
        "company": company,
        "fovorite":
            fovorite == null ? [] : List<dynamic>.from(fovorite!.map((x) => x)),
        "follower": follower,
        "following": following,
        "authorities": authorities == null
            ? []
            : List<dynamic>.from(authorities!.map((x) => x)),
        "coachId":
            coachId == null ? [] : List<dynamic>.from(coachId!.map((x) => x)),
        "rating": rating,
        "profile": profile,
        "experdence": experdence,
        "price": price,
        "education": education == null
            ? []
            : List<dynamic>.from(education!.map((x) => x.toJson())),
        "esy": esy,
        "tig": tig,
        "div": div,
        "sect": sect,
        "serviceY": serviceY,
        "tip": tip,
        "reportTo": reportTo,
      };
}

class EducationModel extends Education {
  EducationModel({
    final String? degree,
    final String? master,
    final String? university,
  }) : super(degree: degree, master: master, university: university);
  factory EducationModel.fromJson(Map<String, dynamic> json) => EducationModel(
        degree: json["degree"],
        master: json["master"],
        university: json["university"],
      );

  Map<String, dynamic> toJson() => {
        "degree": degree,
        "master": master,
        "university": university,
      };
}
