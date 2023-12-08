import 'package:ant_project/src/features/user/home/data/model/get_profile_model.dart';
import 'package:equatable/equatable.dart';

class ProfileEntityTest extends Equatable {
  final int? id;
  final String? username;
  final String? email;
  final String? password;
  final String? image;
  final String? firstname;
  final String? lastname;
  final int? idDepartment;
  final String? department;
  final String? position;
  final String? type;
  final String? mobileNumber;
  final String? workingLocation;
  final String? province;
  final int? site;
  final String? status;
  final String? company;
  final List<int>? fovorite;
  final int? follower;
  final int? following;
  final List<String>? authorities;
  final List<int>? coachId;
  final double? rating;
  final String? profile;
  final String? experdence;
  final String? price;
  final List<Education>? education;
  final int? esy;
  final int? tig;
  final String? div;
  final String? sect;
  final int? serviceY;
  final int? tip;
  final String? reportTo;

  const ProfileEntityTest({
    this.id,
    this.username,
    this.email,
    this.password,
    this.image,
    this.firstname,
    this.lastname,
    this.idDepartment,
    this.department,
    this.position,
    this.type,
    this.mobileNumber,
    this.workingLocation,
    this.province,
    this.site,
    this.status,
    this.company,
    this.fovorite,
    this.follower,
    this.following,
    this.authorities,
    this.coachId,
    this.rating,
    this.profile,
    this.experdence,
    this.price,
    this.education,
    this.esy,
    this.tig,
    this.div,
    this.sect,
    this.serviceY,
    this.tip,
    this.reportTo,
  });
  @override
  List<Object?> get props => [
        username,
        email,
        password,
        image,
        firstname,
        lastname,
        idDepartment,
        department,
        position,
        type,
        mobileNumber,
        workingLocation,
        province,
        site,
        status,
        company,
        fovorite,
        follower,
        following,
        authorities,
        coachId,
        rating,
        profile,
        experdence,
        price,
        education,
        esy,
        tig,
        div,
        sect,
        serviceY,
        tip,
        reportTo,
      ];
}

class Education {
  final String? degree;
  final String? master;
  final String? university;

  Education({
    this.degree,
    this.master,
    this.university,
  });

  toJson() {}
}
