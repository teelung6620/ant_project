import 'package:ant_project/src/core/error/exception.dart';
import 'package:ant_project/src/core/error/failure.dart';

import 'package:ant_project/src/features/user/treatment_history/data/datasource/treatment_remote_datasource.dart';
import 'package:ant_project/src/features/user/treatment_history/domain/entity/treatment_entity.dart';
import 'package:ant_project/src/features/user/treatment_history/domain/repositories/health_repositories.dart';
import 'package:dartz/dartz.dart';

class TreatmentRepositoryIMPL implements TreatmentRepository {
  TreatmentRemoteDatasource remoteDatasource;
  TreatmentRepositoryIMPL({required this.remoteDatasource});
  @override
  Future<Either<Failure, TreatmentEntity>> getTreatment() async {
    try {
      final data = await remoteDatasource.getTreatment();
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
