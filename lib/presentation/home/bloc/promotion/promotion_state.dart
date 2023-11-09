part of 'promotion_bloc.dart';

@freezed
class PromotionState with _$PromotionState {
  const factory PromotionState.initial() = _Initial;
  const factory PromotionState.loading() = _Loading;
  const factory PromotionState.success(PromotionResponseModel data) = _Success;
  const factory PromotionState.errir(String error) = _Error;
}
