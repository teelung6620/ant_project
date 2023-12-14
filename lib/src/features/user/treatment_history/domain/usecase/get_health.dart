import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/all_health_result/domain/entity/health_entity.dart';
import 'package:ant_project/src/features/user/all_health_result/domain/repositories/health_repositories.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/repositories/item_repositories.dart';
import 'package:ant_project/src/features/user/treatment_history/domain/entity/treatment_entity.dart';
import 'package:ant_project/src/features/user/treatment_history/domain/repositories/health_repositories.dart';

import 'package:dartz/dartz.dart';

class GetTreatment {
  final TreatmentRepository repository;

  GetTreatment({required this.repository});
  Future<Either<Failure, TreatmentEntity>> call() async {
    return await repository.getTreatment();
  }
}
