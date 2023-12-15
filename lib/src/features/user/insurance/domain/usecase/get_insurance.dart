import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/repositories/item_repositories.dart';
import 'package:ant_project/src/features/user/insurance/domain/entity/insurance_entity.dart';
import 'package:ant_project/src/features/user/insurance/domain/repositories/insurance_repositories.dart';

import 'package:dartz/dartz.dart';

class GetInsurance {
  final InsuranceRepository repository;

  GetInsurance({required this.repository});
  Future<Either<Failure, List<InsuranceEntity>>> call() async {
    return await repository.getInsurance();
  }
}
