import 'package:equatable/equatable.dart';

class HealthEntity extends Equatable {
  final int? id;
  final int? userId;
  final List<Time>? time;

  HealthEntity({
    this.id,
    this.userId,
    this.time,
  });

  @override
  List<Object?> get props => [id, userId, time];
}

class Time {
  final int? year;
  final DateTime? dateTest;
  final List<TestResult>? testResult;

  Time({
    this.year,
    this.dateTest,
    this.testResult,
  });
  toJson() {}
}

class TestResult {
  final int? category;
  final String? doctor;
  final String? resultText;
  final List<Result>? result;

  TestResult({
    this.category,
    this.doctor,
    this.resultText,
    this.result,
  });
  toJson() {}
}

class Result {
  String? section;
  final dynamic value;
  final String? unit;
  final String? standard;
  final int? status;
  final String? icon;

  Result({
    this.section,
    this.value,
    this.unit,
    this.standard,
    this.status,
    this.icon,
  });
  toJson() {}
}
