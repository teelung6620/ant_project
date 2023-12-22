part of 'get_item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}

class GetItemDataEvent extends ItemEvent {
  @override
  List<Object> get props => [];
}

class RedeemedDataEvent extends ItemEvent {
  final int? idReward;
  final int? quantity;
  final int? idEmployee;

  const RedeemedDataEvent({
    this.idReward,
    this.quantity,
    this.idEmployee,
  });
  @override
  List<Object> get props => [];
}
