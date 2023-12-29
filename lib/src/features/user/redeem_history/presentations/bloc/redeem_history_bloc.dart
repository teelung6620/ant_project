import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/usecase/get_item.dart';
import 'package:ant_project/src/features/user/insurance/domain/entity/insurance_entity.dart';
import 'package:ant_project/src/features/user/insurance/domain/usecase/get_insurance.dart';
import 'package:ant_project/src/features/user/redeem_history/domain/entity/redeem_history_entity.dart';
import 'package:ant_project/src/features/user/redeem_history/domain/usecase/redeem_history_usecase.dart';
import 'package:ant_project/src/features/user/treatment_history/presentations/bloc/get_treatment_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'redeem_history_event.dart';
part 'redeem_history_state.dart';

class RedeemHistoryBloc extends Bloc<RedeemHistoryEvent, RedeemHistoryState> {
  final GetRedeemHistory getRedeemHistory;
  RedeemHistoryBloc({required this.getRedeemHistory})
      : super(RedeemHistoryInitial()) {
    on<RedeemHistoryDataEvent>((event, emit) async {
      emit(RedeemHistoryLoading());
      var getredeem = await getRedeemHistory();
      getredeem.fold((l) => emit(RedeemHistoryFailure(error: l)),
          (r) => emit(RedeemHistorySuccess(getRedeem: r)));
    });
  }
}
