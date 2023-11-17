import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/raja_ongkir/raja_ongkir_remote_datasource.dart';
import '../../../../data/models/responses/user_address/subdistrict_response_model.dart';

part 'subdistrict_event.dart';
part 'subdistrict_state.dart';
part 'subdistrict_bloc.freezed.dart';

class SubdistrictBloc extends Bloc<SubdistrictEvent, SubdistrictState> {
  SubdistrictBloc() : super(const _Initial()) {
    on<_GetSubDistrict>((event, emit) async {
      emit(const _Loading());
      final response = await RajaOngkirRemoteDatasource().getSubDistrict(
        event.cityId,
      );
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
