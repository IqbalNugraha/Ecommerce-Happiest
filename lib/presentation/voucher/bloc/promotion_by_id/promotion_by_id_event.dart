part of 'promotion_by_id_bloc.dart';

@freezed
class PromotionByIdEvent with _$PromotionByIdEvent {
  const factory PromotionByIdEvent.started() = _Started;
  const factory PromotionByIdEvent.getPromotionById(int id) = _GetPromotionById;
}