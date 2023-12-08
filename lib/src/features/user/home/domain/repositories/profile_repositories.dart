import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/home/domain/entity/profile_entity_test.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntityTest>> getProfile();
}
