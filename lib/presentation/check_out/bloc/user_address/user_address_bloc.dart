import 'package:ecommerce_final_task/data/datasources/user_address/user_address_remote_datasource.dart';
import 'package:ecommerce_final_task/data/models/responses/user_address/user_address_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_address_event.dart';
part 'user_address_state.dart';
part 'user_address_bloc.freezed.dart';

class UserAddressBloc extends Bloc<UserAddressEvent, UserAddressState> {
  UserAddressBloc() : super(const _Initial()) {
    

    on<_GetAllUserAddress>((event, emit) async {
      emit(const _Loading());
      final response = await UserAddressRemoteDatasource().getAllUserAddress();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
