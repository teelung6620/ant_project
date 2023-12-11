// To parse this JSON data, do
//
//     final getHealth = getHealthFromJson(jsonString);

import 'dart:convert';

import 'package:ant_project/src/features/user/all_health_result/domain/entity/health_entity.dart';

GetHealthModel healthListFromJson(String str) =>
    GetHealthModel.fromJson(json.decode(str));

String healthListToJson(GetHealthModel data) => json.encode(data.toJson());

class GetHealthModel extends HealthEntity {
  GetHealthModel({
    required super.id,
    required super.userId,
    required super.time,
  });

  factory GetHealthModel.fromJson(Map<String, dynamic> json) => GetHealthModel(
        id: json["id"],
        userId: json["userId"],
        time: json["time"] == null
            ? []
            : List<TimeModel>.from(
                json["time"]!.map((x) => TimeModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "time": time == null
            ? []
            : List<dynamic>.from(time!.map((x) => x.toJson())),
      };
}

class TimeModel extends Time {
  TimeModel({
    required super.year,
    required super.dateTest,
    required super.testResult,
  });

  factory TimeModel.fromJson(Map<String, dynamic> json) => TimeModel(
        year: json["year"],
        dateTest:
            json["dateTest"] == null ? null : DateTime.parse(json["dateTest"]),
        testResult: json["testResult"] == null
            ? []
            : List<TestResultModel>.from(
                json["testResult"]!.map((x) => TestResultModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "dateTest": dateTest?.toIso8601String(),
        "testResult": testResult == null
            ? []
            : List<dynamic>.from(testResult!.map((x) => x.toJson())),
      };
}

class TestResultModel extends TestResult {
  TestResultModel({
    required super.category,
    required super.doctor,
    required super.resultText,
    required super.result,
  });

  factory TestResultModel.fromJson(Map<String, dynamic> json) =>
      TestResultModel(
        category: json["category"],
        doctor: json["doctor"],
        resultText: json["resultText"],
        result: json["result"] == null
            ? []
            : List<ResultModel>.from(
                json["result"]!.map((x) => ResultModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "doctor": doctor,
        "resultText": resultText,
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class ResultModel extends Result {
  ResultModel({
    required super.section,
    required super.value,
    required super.unit,
    required super.standard,
    required super.status,
    required super.icon,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        section: json["section"],
        value: json["value"],
        unit: json["unit"],
        standard: json["standard"],
        status: json["status"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "section": section,
        "value": value,
        "unit": unit,
        "standard": standard,
        "status": status,
        "icon": icon,
      };
}
