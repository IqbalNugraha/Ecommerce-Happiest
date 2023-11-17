import 'package:ecommerce_final_task/data/datasources/user_address/user_address_remote_datasource.dart';
import 'package:ecommerce_final_task/data/models/responses/user_address/add_address_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/requests/user_address/user_address_request_model.dart';

part 'add_address_event.dart';
part 'add_address_state.dart';
part 'add_address_bloc.freezed.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  AddAddressBloc() : super(const _Initial()) {
    on<_AddUserAddress>((event, emit) async {
      emit(const _Loading());
      final response = await UserAddressRemoteDatasource().addUserAddress(
        event.model,
      );
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
