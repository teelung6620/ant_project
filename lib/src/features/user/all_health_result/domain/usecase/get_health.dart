import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/all_health_result/domain/entity/health_entity.dart';
import 'package:ant_project/src/features/user/all_health_result/domain/repositories/health_repositories.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/repositories/item_repositories.dart';

import 'package:dartz/dartz.dart';

class GetHealth {
  final HealthRepository repository;

  GetHealth({required this.repository});
  Future<Either<Failure, HealthEntity>> call(int id) async {
    return await repository.getHealth(id);
  }
}
