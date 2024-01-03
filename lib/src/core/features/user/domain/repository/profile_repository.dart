import 'package:ant_project/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../entity/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> getProfile();
}
