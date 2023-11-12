part of 'cart_list_bloc.dart';

@freezed
class CartListEvent with _$CartListEvent {
  const factory CartListEvent.started() = _Started;
  const factory CartListEvent.add(CartModel cart) = _Add;
  const factory CartListEvent.addCart(CartModel cart) = _AddList;
  const factory CartListEvent.remove(CartModel cart) = _Remove;
  const factory CartListEvent.removeAll(CartModel cart) = _RemoveList;
}
