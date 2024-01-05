import 'package:ant_project/src/core/error/exception.dart';
import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/all_health_result/data/datasource/health_remote_datasource.dart';
import 'package:ant_project/src/features/user/all_health_result/domain/entity/health_entity.dart';
import 'package:ant_project/src/features/user/all_health_result/domain/repositories/health_repositories.dart';
import 'package:ant_project/src/features/user/flexpoint/data/datasource/item_remote_datasource.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/repositories/item_repositories.dart';
import 'package:dartz/dartz.dart';

class HealthRepositoryIMPL implements HealthRepository {
  HealthRemoteDatasource remoteDatasource;
  HealthRepositoryIMPL({required this.remoteDatasource});
  @override
  Future<Either<Failure, HealthEntity>> getHealth(int id) async {
    try {
      final data = await remoteDatasource.getHealth(id);
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
