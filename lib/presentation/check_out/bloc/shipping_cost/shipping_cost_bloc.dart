import 'package:ecommerce_final_task/data/datasources/raja_ongkir/raja_ongkir_remote_datasource.dart';
import 'package:ecommerce_final_task/data/models/responses/user_address/cost_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipping_cost_event.dart';
part 'shipping_cost_state.dart';
part 'shipping_cost_bloc.freezed.dart';

class ShippingCostBloc extends Bloc<ShippingCostEvent, ShippingCostState> {
  ShippingCostBloc() : super(const _Initial()) {
    on<_ShippingCost>((event, emit) async {
      emit(const _Loading());
      final response = await RajaOngkirRemoteDatasource().getCost(
        event.origin,
        event.destination,
        event.courier,
      );
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
