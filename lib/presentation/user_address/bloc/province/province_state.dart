part of 'province_bloc.dart';

@freezed
class ProvinceState with _$ProvinceState {
  const factory ProvinceState.initial() = _Initial;
  const factory ProvinceState.loading() = _Loading;
  const factory ProvinceState.success(ProvinceResponseModel data) = _Success;
  const factory ProvinceState.error(String error) = _Error;
}
