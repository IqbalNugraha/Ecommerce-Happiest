part of 'user_address_bloc.dart';

@freezed
class UserAddressState with _$UserAddressState {
  const factory UserAddressState.initial() = _Initial;
  const factory UserAddressState.loading() = _Loading;
  const factory UserAddressState.success(UserAddressResponseModel data) =
      _Success;
  const factory UserAddressState.error(String error) = _Error;
}
