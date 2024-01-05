import 'package:ant_project/src/core/error/exception.dart';
import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/flexpoint/data/datasource/item_remote_datasource.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/redeem_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/repositories/item_repositories.dart';
import 'package:ant_project/src/features/user/redeem_history/data/datasource/redeem_history_remote_datasource.dart';
import 'package:ant_project/src/features/user/redeem_history/domain/entity/redeem_history_entity.dart';
import 'package:ant_project/src/features/user/redeem_history/domain/repositories/redeem_history_repositories.dart';
import 'package:dartz/dartz.dart';

class RedeemHistoryRepositoryIMPL implements RedeemHistoryRepository {
  RedeemHistoryRemoteDatasource remoteDatasource;
  RedeemHistoryRepositoryIMPL({required this.remoteDatasource});
  @override
  Future<Either<Failure, List<RedeemHistoryEntity>>> getRedeem(
      int idEmp) async {
    try {
      final data = await remoteDatasource.getRedeem(idEmp);
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
