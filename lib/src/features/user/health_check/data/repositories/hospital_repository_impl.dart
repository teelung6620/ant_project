import 'package:ant_project/src/core/error/exception.dart';
import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/flexpoint/data/datasource/item_remote_datasource.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/repositories/item_repositories.dart';
import 'package:ant_project/src/features/user/health_check/data/datasource/hospital_remote_datasource.dart';
import 'package:ant_project/src/features/user/health_check/domain/entity/hospital_entity.dart';
import 'package:ant_project/src/features/user/health_check/domain/repositories/hospital_repositories.dart';
import 'package:ant_project/src/features/user/health_check/domain/usecase/get_hospital.dart';
import 'package:dartz/dartz.dart';

class HospitalRepositoryIMPL implements HospitalRepository {
  HospitalRemoteDatasource remoteDatasource;
  HospitalRepositoryIMPL({required this.remoteDatasource});
  @override
  Future<Either<Failure, List<HospitalEntity>>> getHospital() async {
    try {
      final data = await remoteDatasource.getHospital();
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
