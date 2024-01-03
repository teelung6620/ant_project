import 'package:ant_project/src/core/features/login/data/data_sources/remote/login_api.dart';
import 'package:ant_project/src/core/features/login/data/repositories/login_repository_impl.dart';
import 'package:ant_project/src/core/features/login/domain/repositories/login_repository.dart';
import 'package:ant_project/src/core/features/login/domain/use_cases/login_usecase.dart';
import 'package:ant_project/src/core/features/login/presentation/bloc/login_bloc.dart';
import 'package:ant_project/src/features/user/all_health_result/data/datasource/health_remote_datasource.dart';
import 'package:ant_project/src/features/user/all_health_result/data/repositories/health_repository_impl.dart';
import 'package:ant_project/src/features/user/all_health_result/domain/repositories/health_repositories.dart';
import 'package:ant_project/src/features/user/all_health_result/domain/usecase/get_health.dart';
import 'package:ant_project/src/features/user/all_health_result/presentations/bloc/get_health_bloc.dart';
import 'package:ant_project/src/features/user/flexpoint/data/datasource/item_remote_datasource.dart';
import 'package:ant_project/src/features/user/flexpoint/data/repositories/item_repository_impl.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/repositories/item_repositories.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/usecase/get_item.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/usecase/redeem.dart';
import 'package:ant_project/src/features/user/flexpoint/presentations/bloc/get_item_bloc.dart';
import 'package:ant_project/src/features/user/health_check/data/datasource/hospital_remote_datasource.dart';
import 'package:ant_project/src/features/user/health_check/data/repositories/hospital_repository_impl.dart';
import 'package:ant_project/src/features/user/health_check/domain/repositories/hospital_repositories.dart';
import 'package:ant_project/src/features/user/health_check/domain/usecase/get_hospital.dart';
import 'package:ant_project/src/features/user/health_check/presentations/bloc/get_hospital_bloc.dart';
import 'package:ant_project/src/features/user/home/data/data_source/profile_remote_datasource.dart';
import 'package:ant_project/src/features/user/insurance/data/datasource/insurance_remote_datasource.dart';
import 'package:ant_project/src/features/user/insurance/data/repositories/insurance_repository_impl.dart';
import 'package:ant_project/src/features/user/insurance/domain/repositories/insurance_repositories.dart';
import 'package:ant_project/src/features/user/insurance/domain/usecase/get_insurance.dart';
import 'package:ant_project/src/features/user/insurance/presentations/bloc/get_insurance_bloc.dart';
import 'package:ant_project/src/features/user/profile/data/data_source/profile_remote_datasource.dart';
import 'package:ant_project/src/features/user/profile/data/repositories/profile_repository_impl.dart';
import 'package:ant_project/src/features/user/profile/domain/repositories/profile_repositories.dart';
import 'package:ant_project/src/features/user/profile/domain/usecase/get_profile.dart';
import 'package:ant_project/src/features/user/profile/presentations/bloc/get_profile_bloc.dart';
import 'package:ant_project/src/features/user/redeem_history/data/datasource/redeem_history_remote_datasource.dart';
import 'package:ant_project/src/features/user/redeem_history/data/repositories/redeem_history_repository_impl.dart';
import 'package:ant_project/src/features/user/redeem_history/domain/repositories/redeem_history_repositories.dart';
import 'package:ant_project/src/features/user/redeem_history/domain/usecase/redeem_history_usecase.dart';
import 'package:ant_project/src/features/user/redeem_history/presentations/bloc/redeem_history_bloc.dart';
import 'package:ant_project/src/features/user/treatment_history/data/datasource/treatment_remote_datasource.dart';
import 'package:ant_project/src/features/user/treatment_history/data/repositories/treatment_repository_impl.dart';
import 'package:ant_project/src/features/user/treatment_history/domain/repositories/health_repositories.dart';
import 'package:ant_project/src/features/user/treatment_history/domain/usecase/get_health.dart';
import 'package:ant_project/src/features/user/treatment_history/presentations/bloc/get_treatment_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //External
  sl.registerLazySingleton(() => http.Client());
//---------------------------------------------------------
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

//=========================================================================

  //Get Item
  // * Bloc
  sl.registerFactory(() => GetItemBloc(reDeem: sl(), getItem: sl()));
  //Usecase
  sl.registerLazySingleton(() => GetItem(repository: sl()));
  sl.registerLazySingleton(() => Redeem(repository: sl()));
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

  //=========================================================================

  //Get Insurance
  // * Bloc
  sl.registerFactory(() => GetInsuranceBloc(getInsurance: sl()));
  //Usecase
  sl.registerLazySingleton(() => GetInsurance(repository: sl()));
  //Repository
  sl.registerLazySingleton<InsuranceRepository>(
      () => InsuranceRepositoryIMPL(remoteDatasource: sl()));
  //DataSource
  sl.registerLazySingleton<InsuranceRemoteDatasource>(
      () => InsuranceRemoteDatasourceIMPL(client: sl()));

  //=========================================================================

  //Get Redeem History
  // * Bloc
  sl.registerFactory(() => RedeemHistoryBloc(getRedeemHistory: sl()));
  //Usecase
  sl.registerLazySingleton(() => GetRedeemHistory(repository: sl()));
  //Repository
  sl.registerLazySingleton<RedeemHistoryRepository>(
      () => RedeemHistoryRepositoryIMPL(remoteDatasource: sl()));
  //DataSource
  sl.registerLazySingleton<RedeemHistoryRemoteDatasource>(
      () => RedeemHistoryRemoteDatasourceIMPL(client: sl()));

  //=========================================================================

  //Login
  // * Bloc
  sl.registerFactory(() => LoginBloc(
        loginUseCase: sl(),
      ));

  //Usecase
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  //Repository
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginApi: sl()));
  //DataSource
  sl.registerLazySingleton<LoginApi>(() => LoginApiImpl(client: sl()));
}
