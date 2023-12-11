import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/all_health_result/domain/entity/health_entity.dart';
import 'package:ant_project/src/features/user/all_health_result/domain/usecase/get_health.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/usecase/get_item.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_health_event.dart';
part 'get_health_state.dart';

class GetHealthBloc extends Bloc<HealthEvent, GetHealthState> {
  final GetHealth getHealth;
  GetHealthBloc({required this.getHealth}) : super(GetHealthInitial()) {
    on<GetHealthDataEvent>((event, emit) async {
      emit(GetHealthLoading());
      var gethealth = await getHealth();
      gethealth.fold((l) => emit(GetHealthFailure(error: l)),
          (r) => emit(GetHealthSuccess(getHealth: r)));
    });
  }
}
