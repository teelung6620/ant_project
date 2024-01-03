import 'package:ant_project/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../entities/login_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> login(
      String username, String password, String deviceId);
}
