import 'package:ecommerce_final_task/data/datasources/products/product_remote_datasource.dart';
import 'package:ecommerce_final_task/data/models/responses/product/products_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const _Initial()) {
    on<_GetAllProducts>((event, emit) async {
      emit(const _Loading());
      final response = await ProductRemoteDatasource().getAllProducts();
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
