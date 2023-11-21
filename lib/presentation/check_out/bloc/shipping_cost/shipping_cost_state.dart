part of 'shipping_cost_bloc.dart';

@freezed
class ShippingCostState with _$ShippingCostState {
  const factory ShippingCostState.initial() = _Initial;
  const factory ShippingCostState.loading() = _Loading;
  const factory ShippingCostState.success(CostResponseModel data) = _Success;
  const factory ShippingCostState.error(String error) = _Error;
}
