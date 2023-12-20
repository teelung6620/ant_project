import 'package:ant_project/src/core/error/exception.dart';
import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/home/data/data_source/profile_remote_datasource.dart';
import 'package:ant_project/src/features/user/profile/data/data_source/profile_remote_datasource.dart';
import 'package:ant_project/src/features/user/profile/domain/entity/profile_entity_test.dart';
import 'package:ant_project/src/features/user/profile/domain/repositories/profile_repositories.dart';

import 'package:dartz/dartz.dart';

class ProfileRepositoryIMPL implements ProfileRepository {
  ProfileRemoteDatasource remoteDatasource;
  ProfileRepositoryIMPL({required this.remoteDatasource});
  @override
  Future<Either<Failure, ProfileEntityTest>> getProfile() async {
    try {
      final data = await remoteDatasource.getProfile();
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
