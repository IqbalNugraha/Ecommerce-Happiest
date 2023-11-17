part of 'subdistrict_bloc.dart';

@freezed
class SubdistrictState with _$SubdistrictState {
  const factory SubdistrictState.initial() = _Initial;
  const factory SubdistrictState.loading() = _Loading;
  const factory SubdistrictState.success(SubDistrictResponseModel data) = _Success;
  const factory SubdistrictState.error(String error) = _Error;
}
