part of 'cart_list_bloc.dart';

@freezed
class CartListState with _$CartListState {
  const factory CartListState.initial() = _Initial;
  const factory CartListState.loading() = _Loading;
  const factory CartListState.error(String message) = _Error;
  const factory CartListState.success(List<CartModel> carts) = _Success;
}
