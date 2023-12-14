import 'package:ant_project/src/features/user/all_health_result/data/datasource/health_remote_datasource.dart';
import 'package:ant_project/src/features/user/all_health_result/data/repositories/health_repository_impl.dart';
import 'package:ant_project/src/features/user/all_health_result/domain/repositories/health_repositories.dart';
import 'package:ant_project/src/features/user/all_health_result/domain/usecase/get_health.dart';
import 'package:ant_project/src/features/user/all_health_result/presentations/bloc/get_health_bloc.dart';
import 'package:ant_project/src/features/user/flexpoint/data/datasource/item_remote_datasource.dart';
import 'package:ant_project/src/features/user/flexpoint/data/repositories/item_repository_impl.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/repositories/item_repositories.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/usecase/get_item.dart';
import 'package:ant_project/src/features/user/flexpoint/presentations/bloc/get_item_bloc.dart';
import 'package:ant_project/src/features/user/health_check/data/datasource/hospital_remote_datasource.dart';
import 'package:ant_project/src/features/user/health_check/data/repositories/hospital_repository_impl.dart';
import 'package:ant_project/src/features/user/health_check/domain/repositories/hospital_repositories.dart';
import 'package:ant_project/src/features/user/health_check/domain/usecase/get_hospital.dart';
import 'package:ant_project/src/features/user/health_check/presentations/bloc/get_hospital_bloc.dart';
import 'package:ant_project/src/features/user/home/data/data_source/profile_remote_datasource.dart';
import 'package:ant_project/src/features/user/home/data/repositories/profile_repository_impl.dart';
import 'package:ant_project/src/features/user/home/domain/repositories/profile_repositories.dart';
import 'package:ant_project/src/features/user/home/domain/usecase/get_profile.dart';
import 'package:ant_project/src/features/user/home/presentations/bloc/get_profile_bloc.dart';
import 'package:ant_project/src/features/user/treatment_history/data/datasource/treatment_remote_datasource.dart';
import 'package:ant_project/src/features/user/treatment_history/data/repositories/treatment_repository_impl.dart';
import 'package:ant_project/src/features/user/treatment_history/domain/repositories/health_repositories.dart';
import 'package:ant_project/src/features/user/treatment_history/domain/usecase/get_health.dart';
import 'package:ant_project/src/features/user/treatment_history/presentations/bloc/get_treatment_bloc.dart';
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

  //=========================================================================

  //Get Health
  // * Bloc
  sl.registerFactory(() => GetHealthBloc(getHealth: sl()));
  //Usecase
  sl.registerLazySingleton(() => GetHealth(repository: sl()));
  //Repository
  sl.registerLazySingleton<HealthRepository>(
      () => HealthRepositoryIMPL(remoteDatasource: sl()));
  //DataSource
  sl.registerLazySingleton<HealthRemoteDatasource>(
      () => HealthRemoteDatasourceIMPL(client: sl()));

  //=========================================================================

  //Get Hospital
  // * Bloc
  sl.registerFactory(() => GetHospitalBloc(getHospital: sl()));
  //Usecase
  sl.registerLazySingleton(() => GetHospital(repository: sl()));
  //Repository
  sl.registerLazySingleton<HospitalRepository>(
      () => HospitalRepositoryIMPL(remoteDatasource: sl()));
  //DataSource
  sl.registerLazySingleton<HospitalRemoteDatasource>(
      () => HospitalRemoteDatasourceIMPL(client: sl()));

  //=========================================================================

  //Get Treatment History
  // * Bloc
  sl.registerFactory(() => GetTreatmentBloc(getTreatment: sl()));
  //Usecase
  sl.registerLazySingleton(() => GetTreatment(repository: sl()));
  //Repository
  sl.registerLazySingleton<TreatmentRepository>(
      () => TreatmentRepositoryIMPL(remoteDatasource: sl()));
  //DataSource
  sl.registerLazySingleton<TreatmentRemoteDatasource>(
      () => TreatmentRemoteDatasourceIMPL(client: sl()));
}
