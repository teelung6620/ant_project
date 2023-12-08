import 'package:ant_project/src/core/error/failure.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/entity/item_entity.dart';
import 'package:ant_project/src/features/user/flexpoint/domain/usecase/get_item.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_item_event.dart';
part 'get_item_state.dart';

class GetItemBloc extends Bloc<ItemEvent, GetItemState> {
  final GetItem getItem;
  GetItemBloc({required this.getItem}) : super(GetItemInitial()) {
    on<GetItemDataEvent>((event, emit) async {
      emit(GetItemLoading());
      var getitem = await getItem();
      getitem.fold((l) => emit(GetItemFailure(error: l)),
          (r) => emit(GetItemSuccess(getItem: r)));
    });
  }
}
