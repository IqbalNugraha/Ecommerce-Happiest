import 'package:dartz/dartz.dart';
import 'package:ecommerce_final_task/data/models/responses/promotion/list_promotion_response_model.dart';
import 'package:ecommerce_final_task/data/models/responses/promotion/promotion_response_model.dart';
import 'package:http/http.dart' as http;

import '../../../common/constans/api_services.dart';
import '../../../common/constans/variables.dart';

class PromotionRemoteDatasource {
  final header = {'Content-Type': 'application/json'};

  Future<Either<String, ListPromotionResponseModel>> getAllPromotions() async {
    final response = await http
        .get(
      Uri.parse(ApiServices.baseUrl + ApiServices.getAllPromotions),
      headers: header,
    )
        .timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.msgHttp408, 408);
      },
    );

    if (response.statusCode == 200) {
      return Right(ListPromotionResponseModel.fromJson(response.body));
    } else if (response.statusCode == 201) {
      return Right(ListPromotionResponseModel.fromJson(response.body));
    } else if (response.statusCode == 400) {
      return Right(ListPromotionResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      return Right(ListPromotionResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(ListPromotionResponseModel.fromJson(response.body));
    } else if (response.statusCode == 408) {
      return const Left(Variables.msgHttp408);
    } else {
      return const Left(Variables.msgHttpService);
    }
  }

  Future<Either<String, PromotionResponseModel>> getPromotionById(
    int id,
  ) async {
    final response = await http
        .get(
      Uri.parse("${ApiServices.baseUrl}/api/promotions/$id?populate=*"),
      headers: header,
    )
        .timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.msgHttp408, 408);
      },
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      return Right(PromotionResponseModel.fromJson(response.body));
    } else if (response.statusCode == 201) {
      return Right(PromotionResponseModel.fromJson(response.body));
    } else if (response.statusCode == 400) {
      return Right(PromotionResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      return Right(PromotionResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(PromotionResponseModel.fromJson(response.body));
    } else if (response.statusCode == 408) {
      return const Left(Variables.msgHttp408);
    } else {
      return const Left(Variables.msgHttpService);
    }
  }
}
