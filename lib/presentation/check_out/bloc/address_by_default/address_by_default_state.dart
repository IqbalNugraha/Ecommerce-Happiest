part of 'address_by_default_bloc.dart';

@freezed
class AddressByDefaultState with _$AddressByDefaultState {
  const factory AddressByDefaultState.initial() = _Initial;
  const factory AddressByDefaultState.loading() = _Loading;
  const factory AddressByDefaultState.success(UserAddressResponseModel data) =
      _Success;
  const factory AddressByDefaultState.error(String error) = _Error;
}
