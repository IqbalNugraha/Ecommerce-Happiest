import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../widgets/cart_model.dart';

part 'cart_list_event.dart';
part 'cart_list_state.dart';
part 'cart_list_bloc.freezed.dart';

class CartListBloc extends Bloc<CartListEvent, CartListState> {
  CartListBloc() : super(const _Success([])) {
    on<_Add>((event, emit) {
      final currentState = state as _Success;
      //bila product ada di cart, maka tambahkan quantity
      final index = currentState.carts
          .indexWhere((element) => element.product.id == event.cart.product.id);
      if (index >= 0) {
        currentState.carts[index].quantity += 1;
        emit(const _Loading());
        emit(_Success(currentState.carts));
      } else {
        emit(_Success([...currentState.carts, event.cart]));
      }
    });

    on<_Remove>((event, emit) {
      final currentState = state as _Success;
      //bila product ada di cart, maka dikurangi quantity
      final index = currentState.carts
          .indexWhere((element) => element.product.id == event.cart.product.id);
      if (index >= 0) {
        currentState.carts[index].quantity -= 1;

        if (currentState.carts[index].quantity <= 0) {
          currentState.carts.removeAt(index);
        }
        emit(const _Loading());
        emit(_Success(currentState.carts));
      }
    });

    on<_Started>((event, emit) {
      emit(const _Loading());
      emit(const _Success([]));
    });
  }
}
