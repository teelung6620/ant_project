import 'package:equatable/equatable.dart';

class TreatmentEntity extends Equatable {
  final int? id;
  final int? userId;
  final DateTime? birthDate;
  final HealthStatus? healthStatus;
  final List<Exercise>? exercise;
  final List<Treatment>? treatment;

  const TreatmentEntity({
    this.id,
    this.userId,
    this.birthDate,
    this.healthStatus,
    this.exercise,
    this.treatment,
  });

  @override
  List<Object?> get props =>
      [id, userId, birthDate, healthStatus, exercise, treatment];
}

class Exercise {
  final DateTime? date;
  final double? weight;
  final int? height;
  final int? time;

  Exercise({
    this.date,
    this.weight,
    this.height,
    this.time,
  });
  toJson() {}
}

class HealthStatus {
  final List<String>? family;
  final List<dynamic>? employee;

  HealthStatus({
    this.family,
    this.employee,
  });
  toJson() {}
}

class Treatment {
  final int? id;
  final int? category;
  final int? right;
  final String? section;
  final int? type;
  final DateTime? dete;
  final int? rightUser;
  final String? location;
  final int? expenses;
  final String? icon;
  final String? note;
  final List<State>? state;

  Treatment({
    this.id,
    this.category,
    this.right,
    this.section,
    this.type,
    this.dete,
    this.rightUser,
    this.location,
    this.expenses,
    this.icon,
    this.note,
    this.state,
  });

  toJson() {}
}

class State {
  final int? id;
  final String? action;
  final bool? clear;

  State({
    this.id,
    this.action,
    this.clear,
  });

  toJson() {}
}
