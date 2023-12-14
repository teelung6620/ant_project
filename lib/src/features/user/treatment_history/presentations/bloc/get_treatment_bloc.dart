import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/all_health_result/domain/entity/health_entity.dart';
import 'package:ant_project/src/features/user/all_health_result/domain/usecase/get_health.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/usecase/get_item.dart';
import 'package:ant_project/src/features/user/treatment_history/domain/entity/treatment_entity.dart';
import 'package:ant_project/src/features/user/treatment_history/domain/usecase/get_health.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_treatment_event.dart';
part 'get_treatment_state.dart';

class GetTreatmentBloc extends Bloc<TreatmentEvent, GetTreatmentState> {
  final GetTreatment getTreatment;
  GetTreatmentBloc({required this.getTreatment})
      : super(GetTreatmentInitial()) {
    on<GetTreatmentDataEvent>((event, emit) async {
      emit(GetTreatmentLoading());
      var gettreatment = await getTreatment();
      gettreatment.fold((l) => emit(GetTreatmentFailure(error: l)),
          (r) => emit(GetTreatmentSuccess(getTreatment: r)));
    });
  }
}
