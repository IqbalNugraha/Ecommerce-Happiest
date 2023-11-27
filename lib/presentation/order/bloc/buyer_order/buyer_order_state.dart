part of 'buyer_order_bloc.dart';

@freezed
class BuyerOrderState with _$BuyerOrderState {
  const factory BuyerOrderState.initial() = _Initial;
  const factory BuyerOrderState.loading() = _Loading;
  const factory BuyerOrderState.success(OrderBuyerResponseModel data) = _Success;
  const factory BuyerOrderState.error(String error) = _Error;
}
