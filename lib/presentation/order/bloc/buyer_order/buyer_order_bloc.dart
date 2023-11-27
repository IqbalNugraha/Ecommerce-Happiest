import 'package:ecommerce_final_task/data/datasources/order/order_remote_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/responses/order/order_buyer_response_model.dart';

part 'buyer_order_event.dart';
part 'buyer_order_state.dart';
part 'buyer_order_bloc.freezed.dart';

class BuyerOrderBloc extends Bloc<BuyerOrderEvent, BuyerOrderState> {
  BuyerOrderBloc() : super(const _Initial()) {
    on<_GetBuyerOrder>((event, emit) async {
      emit(const _Loading());
      final response = await OrderRemoteDatasource().getOrderBuyerId();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
