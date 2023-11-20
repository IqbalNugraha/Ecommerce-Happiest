import 'package:ecommerce_final_task/data/models/requests/user_address/edit_user_address_request_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/user_address/user_address_remote_datasource.dart';
import '../../../../data/models/responses/user_address/add_address_response_model.dart';

part 'edit_address_event.dart';
part 'edit_address_state.dart';
part 'edit_address_bloc.freezed.dart';

class EditAddressBloc extends Bloc<EditAddressEvent, EditAddressState> {
  EditAddressBloc() : super(const _Initial()) {
    on<_EditUserAddress>((event, emit) async {
      emit(const _Loading());
      final response = await UserAddressRemoteDatasource().editUserAddress(
        event.id,
        event.model,
      );
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
