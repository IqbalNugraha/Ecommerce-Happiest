import 'package:ecommerce_final_task/data/datasources/raja_ongkir/raja_ongkir_remote_datasource.dart';
import 'package:ecommerce_final_task/data/models/responses/user_address/city_response_model.dart';
import 'package:ecommerce_final_task/data/models/responses/user_address/province_response_model.dart';
import 'package:ecommerce_final_task/data/models/responses/user_address/subdistrict_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'raja_ongkir_event.dart';
part 'raja_ongkir_state.dart';
part 'raja_ongkir_bloc.freezed.dart';

class RajaOngkirBloc extends Bloc<RajaOngkirEvent, RajaOngkirState> {
  RajaOngkirBloc() : super(const _Initial()) {
    on<_GetProvince>((event, emit) async {
      emit(const _Loading());
      final response = await RajaOngkirRemoteDatasource().getProvinces();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_LoadedProvince(r)),
      );
    });

    on<_GetCities>((event, emit) async {
      emit(const _Loading());
      final response = await RajaOngkirRemoteDatasource().getCities(event.provinceId);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_LoadedCity(r)),
      );
    });

    on<_GetSubDistrict>((event, emit) async {
      emit(const _Loading());
      final response = await RajaOngkirRemoteDatasource().getSubDistrict(event.cityId);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_LoadedSubDistrict(r)),
      );
    });
  }
}
