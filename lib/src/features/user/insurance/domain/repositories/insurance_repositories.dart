import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/insurance/domain/entity/insurance_entity.dart';
import 'package:dartz/dartz.dart';

abstract class InsuranceRepository {
  Future<Either<Failure, List<InsuranceEntity>>> getInsurance();
}
