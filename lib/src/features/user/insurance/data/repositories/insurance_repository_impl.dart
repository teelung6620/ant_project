import 'package:ant_project/src/core/error/exception.dart';
import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/flexpoint/data/datasource/item_remote_datasource.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/repositories/item_repositories.dart';
import 'package:ant_project/src/features/user/insurance/data/datasource/insurance_remote_datasource.dart';
import 'package:ant_project/src/features/user/insurance/domain/entity/insurance_entity.dart';
import 'package:ant_project/src/features/user/insurance/domain/repositories/insurance_repositories.dart';
import 'package:ant_project/src/features/user/insurance/domain/usecase/get_insurance.dart';
import 'package:dartz/dartz.dart';

class InsuranceRepositoryIMPL implements InsuranceRepository {
  InsuranceRemoteDatasource remoteDatasource;
  InsuranceRepositoryIMPL({required this.remoteDatasource});
  @override
  Future<Either<Failure, List<InsuranceEntity>>> getInsurance() async {
    try {
      final data = await remoteDatasource.getInsurance();
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
