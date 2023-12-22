import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/redeem_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/usecase/get_item.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/usecase/redeem.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_item_event.dart';
part 'get_item_state.dart';

class GetItemBloc extends Bloc<ItemEvent, GetItemState> {
  final GetItem getItem;
  final Redeem reDeem;
  GetItemBloc({required this.getItem, required this.reDeem})
      : super(GetItemInitial()) {
    on<GetItemDataEvent>((event, emit) async {
      emit(GetItemLoading());
      var getitem = await getItem();
      getitem.fold((l) => emit(GetItemFailure(error: l)),
          (r) => emit(GetItemSuccess(getItem: r)));
    });

    on<RedeemedDataEvent>((event, emit) async {
      emit(RedeemLoading());
      var redeem =
          await reDeem(event.idEmployee!, event.idReward!, event.quantity!);
      redeem.fold(
          (l) => emit(RedeemFailure(error: l)), (r) => emit(RedeemSuccess()));
    });
  }
}
