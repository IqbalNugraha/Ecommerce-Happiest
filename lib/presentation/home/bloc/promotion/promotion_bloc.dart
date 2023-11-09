import 'package:ecommerce_final_task/data/datasources/promotion/promotion_remote_datasource.dart';
import 'package:ecommerce_final_task/data/models/responses/promotion/promotion_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion_event.dart';
part 'promotion_state.dart';
part 'promotion_bloc.freezed.dart';

class PromotionBloc extends Bloc<PromotionEvent, PromotionState> {
  PromotionBloc() : super(const _Initial()) {
    on<_GetAllPromotions>((event, emit) async {
      emit(const _Loading());
      final response = await PromotionRemoteDatasource().getAllPromotions();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
