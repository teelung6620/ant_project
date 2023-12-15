import 'package:ant_project/src/features/user/home/data/model/get_profile_model.dart';
import 'package:equatable/equatable.dart';

class ProfileEntityTest extends Equatable {
  final int? idEmployees;
  final String? employeeId;
  final String? titleTh;
  final String? firstnameTh;
  final String? lastnameTh;
  final String? nicknameTh;
  final dynamic titleEn;
  final DateTime? hiringDate;
  final String? personalId;
  final String? email;
  final String? telephoneMobile;
  final String? positionName;
  final String? sectionName;
  final String? departmentName;
  final String? divisionName;
  final String? address;
  final String? houseNo;
  final String? village;
  final String? villageNo;
  final String? alley;
  final String? road;
  final String? subDistrict;
  final String? district;
  final String? provience;
  final String? areaCode;
  final String? companyName;
  final String? firstnameEn;
  final String? lastnameEn;
  final String? nicknameEn;
  final int? idRole;
  final int? isActive;
  final dynamic createDate;
  final dynamic createBy;
  final dynamic idManagerLv1;
  final dynamic idManagerLv2;
  final int? idPaymentType;
  final int? idCompany;
  final dynamic imageName;
  final dynamic servY;
  final dynamic servM;
  final dynamic userPf;
  final String? taxId;
  final String? maritalStatus;
  final int? uniwelfareFlexcoins;
  final dynamic managerLv1FirstnameTh;
  final dynamic managerLv1LastnameTh;
  final dynamic managerLv1FirstnameEn;
  final dynamic managerLv1LastnameEn;
  final dynamic managerLv1Email;
  final dynamic managerLv2FirstnameTh;
  final dynamic managerLv2LastnameTh;
  final dynamic managerLv2FirstnameEn;
  final dynamic managerLv2LastnameEn;
  final dynamic managerLv2Email;
  final String? emergencyContact;
  final String? emergencyRelationship;
  final String? emergencyPhone;
  final DateTime? birthday;
  final String? workingType;
  final DateTime? updateDate;
  final dynamic updateBy;
  final String? roleName;
  final List<String>? roles;
  final List<Education>? educations;
  final dynamic imageProfile;

  const ProfileEntityTest({
    this.idEmployees,
    this.employeeId,
    this.titleTh,
    this.firstnameTh,
    this.lastnameTh,
    this.nicknameTh,
    this.titleEn,
    this.hiringDate,
    this.personalId,
    this.email,
    this.telephoneMobile,
    this.positionName,
    this.sectionName,
    this.departmentName,
    this.divisionName,
    this.address,
    this.houseNo,
    this.village,
    this.villageNo,
    this.alley,
    this.road,
    this.subDistrict,
    this.district,
    this.provience,
    this.areaCode,
    this.companyName,
    this.firstnameEn,
    this.lastnameEn,
    this.nicknameEn,
    this.idRole,
    this.isActive,
    this.createDate,
    this.createBy,
    this.idManagerLv1,
    this.idManagerLv2,
    this.idPaymentType,
    this.idCompany,
    this.imageName,
    this.servY,
    this.servM,
    this.userPf,
    this.taxId,
    this.maritalStatus,
    this.uniwelfareFlexcoins,
    this.managerLv1FirstnameTh,
    this.managerLv1LastnameTh,
    this.managerLv1FirstnameEn,
    this.managerLv1LastnameEn,
    this.managerLv1Email,
    this.managerLv2FirstnameTh,
    this.managerLv2LastnameTh,
    this.managerLv2FirstnameEn,
    this.managerLv2LastnameEn,
    this.managerLv2Email,
    this.emergencyContact,
    this.emergencyRelationship,
    this.emergencyPhone,
    this.birthday,
    this.workingType,
    this.updateDate,
    this.updateBy,
    this.roleName,
    this.roles,
    this.educations,
    this.imageProfile,
  });
  @override
  List<Object?> get props => [
        idEmployees,
        employeeId,
        titleTh,
        firstnameTh,
        lastnameTh,
        nicknameTh,
        titleEn,
        hiringDate,
        personalId,
        email,
        telephoneMobile,
        positionName,
        sectionName,
        departmentName,
        divisionName,
        address,
        houseNo,
        village,
        villageNo,
        alley,
        road,
        subDistrict,
        district,
        provience,
        areaCode,
        companyName,
        firstnameEn,
        lastnameEn,
        nicknameEn,
        idRole,
        isActive,
        createDate,
        createBy,
        idManagerLv1,
        idManagerLv2,
        idPaymentType,
        idCompany,
        imageName,
        servY,
        servM,
        userPf,
        taxId,
        maritalStatus,
        uniwelfareFlexcoins,
        managerLv1FirstnameTh,
        managerLv1LastnameTh,
        managerLv1FirstnameEn,
        managerLv1LastnameEn,
        managerLv1Email,
        managerLv2FirstnameTh,
        managerLv2LastnameTh,
        managerLv2FirstnameEn,
        managerLv2LastnameEn,
        managerLv2Email,
        emergencyContact,
        emergencyRelationship,
        emergencyPhone,
        birthday,
        workingType,
        updateDate,
        updateBy,
        roleName,
        roles,
        educations,
        imageProfile,
      ];
}

class Education {
  final int? idEducations;
  final String? degree;
  final String? university;
  final String? faculty;
  final String? major;
  final int? fromYear;
  final int? endYear;
  final String? gpa;
  final int? idEmployees;

  Education({
    this.idEducations,
    this.degree,
    this.university,
    this.faculty,
    this.major,
    this.fromYear,
    this.endYear,
    this.gpa,
    this.idEmployees,
  });

  toJson() {}
}
