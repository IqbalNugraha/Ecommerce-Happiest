part of 'user_address_bloc.dart';

@freezed
class UserAddressEvent with _$UserAddressEvent {
  const factory UserAddressEvent.started() = _Started;
  const factory UserAddressEvent.getAllUserAddress() = _GetAllUserAddress;
  const factory UserAddressEvent.getUserAddressByDefault(bool isDefault) = _GetUserAddressByDefault;
}