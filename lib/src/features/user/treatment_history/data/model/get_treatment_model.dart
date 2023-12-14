// To parse this JSON data, do
//
//     final treatmentModel = treatmentModelFromJson(jsonString);

import 'dart:convert';

import 'package:ant_project/src/features/user/treatment_history/domain/entity/treatment_entity.dart';

GetTreatmentModel treatmentListFromJson(String str) =>
    GetTreatmentModel.fromJson(json.decode(str));

String treatmentListToJson(GetTreatmentModel data) =>
    json.encode(data.toJson());

class GetTreatmentModel extends TreatmentEntity {
  GetTreatmentModel({
    required super.id,
    required super.userId,
    required super.birthDate,
    required super.healthStatus,
    required super.exercise,
    required super.treatment,
  });

  factory GetTreatmentModel.fromJson(Map<String, dynamic> json) =>
      GetTreatmentModel(
        id: json["id"],
        userId: json["userId"],
        birthDate: json["birthDate"] == null
            ? null
            : DateTime.parse(json["birthDate"]),
        healthStatus: json["healthStatus"] == null
            ? null
            : HealthStatusModel.fromJson(json["healthStatus"]),
        exercise: json["exercise"] == null
            ? []
            : List<Exercise>.from(
                json["exercise"]!.map((x) => ExerciseModel.fromJson(x))),
        treatment: json["treatment"] == null
            ? []
            : List<Treatment>.from(
                json["treatment"]!.map((x) => TreatmentModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "birthDate": birthDate?.toIso8601String(),
        "healthStatus": healthStatus?.toJson(),
        "exercise": exercise == null
            ? []
            : List<dynamic>.from(exercise!.map((x) => x.toJson())),
        "treatment": treatment == null
            ? []
            : List<dynamic>.from(treatment!.map((x) => x.toJson())),
      };
}

class ExerciseModel extends Exercise {
  ExerciseModel({
    required super.date,
    required super.weight,
    required super.height,
    required super.time,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        weight: json["weight"]?.toDouble(),
        height: json["height"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "weight": weight,
        "height": height,
        "time": time,
      };
}

class HealthStatusModel extends HealthStatus {
  HealthStatusModel({
    required super.family,
    required super.employee,
  });

  factory HealthStatusModel.fromJson(Map<String, dynamic> json) =>
      HealthStatusModel(
        family: json["family"] == null
            ? []
            : List<String>.from(json["family"]!.map((x) => x)),
        employee: json["employee"] == null
            ? []
            : List<dynamic>.from(json["employee"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "family":
            family == null ? [] : List<dynamic>.from(family!.map((x) => x)),
        "employee":
            employee == null ? [] : List<dynamic>.from(employee!.map((x) => x)),
      };
}

class TreatmentModel extends Treatment {
  TreatmentModel({
    required super.id,
    required super.category,
    required super.right,
    required super.section,
    required super.type,
    required super.dete,
    required super.rightUser,
    required super.location,
    required super.expenses,
    required super.icon,
    required super.note,
    required super.state,
  });

  factory TreatmentModel.fromJson(Map<String, dynamic> json) => TreatmentModel(
        id: json["id"],
        category: json["category"],
        right: json["right"],
        section: json["section"],
        type: json["type"],
        dete: json["dete"] == null ? null : DateTime.parse(json["dete"]),
        rightUser: json["rightUser"],
        location: json["location"],
        expenses: json["expenses"],
        icon: json["icon"],
        note: json["note"],
        state: json["state"] == null
            ? []
            : List<State>.from(
                json["state"]!.map((x) => StateModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "right": right,
        "section": section,
        "type": type,
        "dete": dete?.toIso8601String(),
        "rightUser": rightUser,
        "location": location,
        "expenses": expenses,
        "icon": icon,
        "note": note,
        "state": state == null
            ? []
            : List<dynamic>.from(state!.map((x) => x.toJson())),
      };
}

class StateModel extends State {
  StateModel({
    required super.id,
    required super.action,
    required super.clear,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        id: json["id"],
        action: json["action"],
        clear: json["clear"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "action": action,
        "clear": clear,
      };
}
