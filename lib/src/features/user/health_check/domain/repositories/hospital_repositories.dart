import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/health_check/domain/entity/hospital_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HospitalRepository {
  Future<Either<Failure, List<HospitalEntity>>> getHospital();
}
