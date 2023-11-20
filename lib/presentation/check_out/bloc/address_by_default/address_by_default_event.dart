part of 'address_by_default_bloc.dart';

@freezed
class AddressByDefaultEvent with _$AddressByDefaultEvent {
  const factory AddressByDefaultEvent.started() = _Started;
  const factory AddressByDefaultEvent.getUserAddressByDefault(bool isDefault) =
      _GetUserAddressByDefault;
}