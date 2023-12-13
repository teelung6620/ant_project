import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/repositories/item_repositories.dart';
import 'package:ant_project/src/features/user/health_check/domain/entity/hospital_entity.dart';
import 'package:ant_project/src/features/user/health_check/domain/repositories/hospital_repositories.dart';

import 'package:dartz/dartz.dart';

class GetHospital {
  final HospitalRepository repository;

  GetHospital({required this.repository});
  Future<Either<Failure, List<HospitalEntity>>> call() async {
    return await repository.getHospital();
  }
}
