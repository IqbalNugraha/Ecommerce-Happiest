import 'package:bloc/bloc.dart';
import 'package:ecommerce_final_task/data/datasources/auth/auth_remote_datasource.dart';
import 'package:ecommerce_final_task/data/models/requests/auth/register_request_model.dart';
import 'package:ecommerce_final_task/data/models/responses/auth/auth_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const _Initial()) {
    on<_Register>((event, emit) async {
      emit(const _Loading());
      final response = await AuthRemoteDatasource().register(event.model);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
