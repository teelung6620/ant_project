import 'package:ant_project/src/features/user/flexpoint/data/datasource/item_remote_datasource.dart';
import 'package:ant_project/src/features/user/flexpoint/data/repositories/item_repository_impl.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/repositories/item_repositories.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/usecase/get_item.dart';
import 'package:ant_project/src/features/user/flexpoint/presentations/bloc/get_item_bloc.dart';
import 'package:ant_project/src/features/user/home/data/data_source/profile_remote_datasource.dart';
import 'package:ant_project/src/features/user/home/data/repositories/profile_repository_impl.dart';
import 'package:ant_project/src/features/user/home/domain/repositories/profile_repositories.dart';
import 'package:ant_project/src/features/user/home/domain/usecase/get_profile.dart';
import 'package:ant_project/src/features/user/home/presentations/bloc/get_profile_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //GetProfile
  // * Bloc
  sl.registerFactory(() => GetProfileBloc(getProfile: sl()));
  //Usecase
  sl.registerLazySingleton(() => GetProfile(repository: sl()));
  //Repository
  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryIMPL(remoteDatasource: sl()));
  //DataSource
  sl.registerLazySingleton<ProfileRemoteDatasource>(
      () => ProfileRemoteDatasourceIMPL(client: sl()));
  //External
  sl.registerLazySingleton(() => http.Client());

//=========================================================================

  //Get Item
  // * Bloc
  sl.registerFactory(() => GetItemBloc(getItem: sl()));
  //Usecase
  sl.registerLazySingleton(() => GetItem(repository: sl()));
  //Repository
  sl.registerLazySingleton<ItemRepository>(
      () => ItemRepositoryIMPL(remoteDatasource: sl()));
  //DataSource
  sl.registerLazySingleton<ItemRemoteDatasource>(
      () => ItemRemoteDatasourceIMPL(client: sl()));
}
