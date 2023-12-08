import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/repositories/item_repositories.dart';

import 'package:dartz/dartz.dart';

class GetItem {
  final ItemRepository repository;

  GetItem({required this.repository});
  Future<Either<Failure, List<ItemEntity>>> call() async {
    return await repository.getItem();
  }
}
