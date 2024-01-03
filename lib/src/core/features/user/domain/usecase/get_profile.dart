import 'package:ant_project/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../entity/profile_entity.dart';
import '../repository/profile_repository.dart';

class GetProfile {
  final ProfileRepository repository;
  GetProfile({required this.repository});

  Future<Either<Failure, ProfileEntity>> call() async {
    return await repository.getProfile();
  }
}
