part of 'promotion_bloc.dart';

@freezed
class PromotionEvent with _$PromotionEvent {
  const factory PromotionEvent.started() = _Started;
  const factory PromotionEvent.getAllPromotions() = _GetAllPromotions;
}