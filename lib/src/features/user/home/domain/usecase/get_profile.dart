import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/home/domain/entity/profile_entity_test.dart';
import 'package:ant_project/src/features/user/home/domain/repositories/profile_repositories.dart';
import 'package:dartz/dartz.dart';

class GetProfile {
  final ProfileRepository repository;

  GetProfile({required this.repository});
  Future<Either<Failure, List<ProfileEntityTest>>> call() async {
    return await repository.getProfile();
  }
}
