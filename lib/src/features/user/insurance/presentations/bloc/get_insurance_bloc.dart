import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/usecase/get_item.dart';
import 'package:ant_project/src/features/user/insurance/domain/entity/insurance_entity.dart';
import 'package:ant_project/src/features/user/insurance/domain/usecase/get_insurance.dart';
import 'package:ant_project/src/features/user/treatment_history/presentations/bloc/get_treatment_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_insurance_event.dart';
part 'get_insurance_state.dart';

class GetInsuranceBloc extends Bloc<InsuranceEvent, GetInsuranceState> {
  final GetInsurance getInsurance;
  GetInsuranceBloc({required this.getInsurance})
      : super(GetInsuranceInitial()) {
    on<GetInsuranceDataEvent>((event, emit) async {
      emit(GetInsuranceLoading());
      var getinsurance = await getInsurance();
      getinsurance.fold((l) => emit(GetInsuranceFailure(error: l)),
          (r) => emit(GetInsuranceSuccess(getInsurance: r)));
    });
  }
}
