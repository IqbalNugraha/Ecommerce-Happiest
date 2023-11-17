part of 'raja_ongkir_bloc.dart';

@freezed
class RajaOngkirState with _$RajaOngkirState {
  const factory RajaOngkirState.initial() = _Initial;
  const factory RajaOngkirState.loading() = _Loading;
  const factory RajaOngkirState.loadedProvince(ProvinceResponseModel data) = _LoadedProvince;
  const factory RajaOngkirState.loadedCity(CityResponseModel data) = _LoadedCity;
  const factory RajaOngkirState.loadedSubDistrict(SubDistrictResponseModel data) = _LoadedSubDistrict;
  const factory RajaOngkirState.error(String error) = _Error;
}
