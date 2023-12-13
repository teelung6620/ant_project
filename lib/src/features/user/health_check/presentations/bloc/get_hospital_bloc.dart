import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/all_health_result/domain/entity/health_entity.dart';
import 'package:ant_project/src/features/user/all_health_result/domain/usecase/get_health.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/usecase/get_item.dart';
import 'package:ant_project/src/features/user/health_check/domain/entity/hospital_entity.dart';
import 'package:ant_project/src/features/user/health_check/domain/usecase/get_hospital.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_hospital_event.dart';
part 'get_hospital_state.dart';

class GetHospitalBloc extends Bloc<HospitalEvent, GetHospitalState> {
  final GetHospital getHospital;
  GetHospitalBloc({required this.getHospital}) : super(GetHospitalInitial()) {
    on<GetHospitalDataEvent>((event, emit) async {
      emit(GetHospitalLoading());
      var gethealth = await getHospital();
      gethealth.fold((l) => emit(GetHospitalFailure(error: l)),
          (r) => emit(GetHospitalSuccess(getHospital: r)));
    });
  }
}
