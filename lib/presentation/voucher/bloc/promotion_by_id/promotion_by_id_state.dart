part of 'promotion_by_id_bloc.dart';

@freezed
class PromotionByIdState with _$PromotionByIdState {
  const factory PromotionByIdState.initial() = _Initial;
  const factory PromotionByIdState.loading() = _Loading;
  const factory PromotionByIdState.success(PromotionResponseModel data) =
      _Success;
  const factory PromotionByIdState.error(String error) = _Error;
}
