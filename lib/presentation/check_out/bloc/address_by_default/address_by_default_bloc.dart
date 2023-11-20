import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/user_address/user_address_remote_datasource.dart';
import '../../../../data/models/responses/user_address/user_address_response_model.dart';

part 'address_by_default_event.dart';
part 'address_by_default_state.dart';
part 'address_by_default_bloc.freezed.dart';

class AddressByDefaultBloc extends Bloc<AddressByDefaultEvent, AddressByDefaultState> {
  AddressByDefaultBloc() : super(const _Initial()) {
    on<_GetUserAddressByDefault>((event, emit) async {
      emit(const _Loading());
      final response =
          await UserAddressRemoteDatasource().getUserAddressByDefault(
        event.isDefault,
      );
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
