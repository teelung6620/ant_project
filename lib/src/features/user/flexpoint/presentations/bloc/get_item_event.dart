part of 'get_item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}

class GetItemDataEvent extends ItemEvent {
  final int idCom;

  GetItemDataEvent({required this.idCom});

  @override
  List<Object> get props => [idCom];
}

class RedeemedDataEvent extends ItemEvent {
  final int? idReward;
  final int? quantity;
  final int? idEmployee;
  final List<CoinRe>? coins;

  const RedeemedDataEvent(
      {this.idReward, this.quantity, this.idEmployee, this.coins});
  @override
  List<Object> get props => [];
}
