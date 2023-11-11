part of 'cart_list_bloc.dart';

@freezed
class CartListEvent with _$CartListEvent {
  const factory CartListEvent.started() = _Started;
  const factory CartListEvent.add(CartModel cart) = _Add;
  const factory CartListEvent.remove(CartModel cart) = _Remove;  
}
