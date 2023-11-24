import 'package:dartz/dartz.dart';
import 'package:ecommerce_final_task/common/constans/api_services.dart';
import 'package:ecommerce_final_task/data/models/requests/order/order_request_model.dart';
import 'package:ecommerce_final_task/data/models/responses/order/order_detail_response_model.dart';
import 'package:ecommerce_final_task/data/models/responses/order/order_response_model.dart';
import 'package:http/http.dart' as http;

import '../../../common/constans/variables.dart';
import '../local_remote_datasources.dart';

class OrderRemoteDatasource {
  Future<Either<String, OrderResponseModel>> order(
    OrderRequestModel model,
  ) async {
    final token = await LocalDatasource().getToken();
    final response = await http
        .post(
      Uri.parse(ApiServices.baseUrl + ApiServices.order),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: model.toJson(),
    )
        .timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.msgHttp408, 408);
      },
    );

    if (response.statusCode == 200) {
      return Right(OrderResponseModel.fromJson(response.body));
    } else if (response.statusCode == 201) {
      return Right(OrderResponseModel.fromJson(response.body));
    } else if (response.statusCode == 400) {
      return Right(OrderResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      return Right(OrderResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(OrderResponseModel.fromJson(response.body));
    } else if (response.statusCode == 408) {
      return const Left(Variables.msgHttp408);
    } else {
      return const Left(Variables.msgHttpService);
    }
  }

  Future<Either<String, OrderDetailResponseModel>> getOrderById(
    String id,
  ) async {
    final token = await LocalDatasource().getToken();
    final response = await http.get(
      Uri.parse('${ApiServices.baseUrl}/api/orders/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    ).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.msgHttp408, 408);
      },
    );

    if (response.statusCode == 200) {
      return Right(OrderDetailResponseModel.fromJson(response.body));
    } else if (response.statusCode == 201) {
      return Right(OrderDetailResponseModel.fromJson(response.body));
    } else if (response.statusCode == 400) {
      return Right(OrderDetailResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      return Right(OrderDetailResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(OrderDetailResponseModel.fromJson(response.body));
    } else if (response.statusCode == 408) {
      return const Left(Variables.msgHttp408);
    } else {
      return const Left(Variables.msgHttpService);
    }
  }
}
