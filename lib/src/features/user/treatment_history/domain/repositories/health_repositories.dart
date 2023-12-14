import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/all_health_result/domain/entity/health_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/treatment_history/domain/entity/treatment_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TreatmentRepository {
  Future<Either<Failure, TreatmentEntity>> getTreatment();
}
