import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/redeem_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/repositories/item_repositories.dart';

import 'package:dartz/dartz.dart';

class Redeem {
  final ItemRepository repository;

  Redeem({required this.repository});
  Future<Either<Failure, void>> call(
      int idReward, int quantity, int idEmployee, List<CoinRe> coins) async {
    return await repository.redeem(idEmployee, quantity, idReward, coins);
  }
}
