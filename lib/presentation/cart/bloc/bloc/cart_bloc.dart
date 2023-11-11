import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../widgets/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const _Initial()) {
    on<_Add>((event, emit) {
      event.cart.quantity += 1;
      event.cart.total = (event.cart.quantity) *
          (int.parse(event.cart.product.attributes!.price!));
      emit(const _Loading());
      emit(_Success(event.cart));
    });

    on<_Remove>((event, emit) {
      if (event.cart.quantity > 0) {
        event.cart.quantity -= 1;
        event.cart.total -= 1;
      }
      emit(const _Loading());
      emit(_Success(event.cart));
    });
  }
}
