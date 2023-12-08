import 'package:ant_project/src/core/error/exception.dart';
import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/flexpoint/data/datasource/item_remote_datasource.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/repositories/item_repositories.dart';
import 'package:dartz/dartz.dart';

class ItemRepositoryIMPL implements ItemRepository {
  ItemRemoteDatasource remoteDatasource;
  ItemRepositoryIMPL({required this.remoteDatasource});
  @override
  Future<Either<Failure, List<ItemEntity>>> getItem() async {
    try {
      final data = await remoteDatasource.getItem();
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
