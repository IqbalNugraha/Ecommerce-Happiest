part of 'shipping_cost_bloc.dart';

@freezed
class ShippingCostEvent with _$ShippingCostEvent {
  const factory ShippingCostEvent.started() = _Started;
  const factory ShippingCostEvent.shippingCost({
    required String origin,
    required String destination,
    required String courier,
  }) = _ShippingCost;
}
