part of 'raja_ongkir_bloc.dart';

@freezed
class RajaOngkirEvent with _$RajaOngkirEvent {
  const factory RajaOngkirEvent.started() = _Started;
  const factory RajaOngkirEvent.getProvince() = _GetProvince;
  const factory RajaOngkirEvent.getCities(String provinceId) = _GetCities;
  const factory RajaOngkirEvent.getSubDistrict(String cityId) = _GetSubDistrict;
}