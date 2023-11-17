import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/raja_ongkir/raja_ongkir_remote_datasource.dart';
import '../../../../data/models/responses/user_address/province_response_model.dart';

part 'province_event.dart';
part 'province_state.dart';
part 'province_bloc.freezed.dart';

class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {
  ProvinceBloc() : super(const _Initial()) {
    on<_GetProvince>((event, emit) async {
      emit(const _Loading());
      final response = await RajaOngkirRemoteDatasource().getProvinces();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
