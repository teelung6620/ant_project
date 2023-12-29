import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/insurance/domain/entity/insurance_entity.dart';
import 'package:ant_project/src/features/user/redeem_history/domain/entity/redeem_history_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RedeemHistoryRepository {
  Future<Either<Failure, List<RedeemHistoryEntity>>> getRedeem();
}
