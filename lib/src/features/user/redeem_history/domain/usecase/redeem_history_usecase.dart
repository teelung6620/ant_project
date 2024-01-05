import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/repositories/item_repositories.dart';
import 'package:ant_project/src/features/user/insurance/domain/entity/insurance_entity.dart';
import 'package:ant_project/src/features/user/insurance/domain/repositories/insurance_repositories.dart';
import 'package:ant_project/src/features/user/redeem_history/domain/entity/redeem_history_entity.dart';
import 'package:ant_project/src/features/user/redeem_history/domain/repositories/redeem_history_repositories.dart';

import 'package:dartz/dartz.dart';

class GetRedeemHistory {
  final RedeemHistoryRepository repository;

  GetRedeemHistory({required this.repository});
  Future<Either<Failure, List<RedeemHistoryEntity>>> call(int idEmp) async {
    return await repository.getRedeem(idEmp);
  }
}
