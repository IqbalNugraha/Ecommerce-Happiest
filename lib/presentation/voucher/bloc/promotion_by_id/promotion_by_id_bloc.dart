import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/promotion/promotion_remote_datasource.dart';
import '../../../../data/models/responses/promotion/promotion_response_model.dart';

part 'promotion_by_id_event.dart';
part 'promotion_by_id_state.dart';
part 'promotion_by_id_bloc.freezed.dart';

class PromotionByIdBloc extends Bloc<PromotionByIdEvent, PromotionByIdState> {
  PromotionByIdBloc() : super(const _Initial()) {
    on<_GetPromotionById>((event, emit) async {
      emit(const _Loading());
      final response =
          await PromotionRemoteDatasource().getPromotionById(event.id);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
