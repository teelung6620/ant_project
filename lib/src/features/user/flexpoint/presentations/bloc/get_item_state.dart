part of 'get_item_bloc.dart';

abstract class GetItemState extends Equatable {
  const GetItemState();

  @override
  List<Object> get props => [];
}

final class GetItemInitial extends GetItemState {
  @override
  List<Object> get props => [];
}

final class GetItemLoading extends GetItemState {
  @override
  List<Object> get props => [];
}

final class GetItemFailure extends GetItemState {
  final Failure error;

  GetItemFailure({required this.error});
  @override
  List<Object> get props => [];
}

final class GetItemSuccess extends GetItemState {
  final List<ItemEntity> getItem;

  GetItemSuccess({required this.getItem});
  @override
  List<Object> get props => [];
}
