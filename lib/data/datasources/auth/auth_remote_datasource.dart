import 'package:dartz/dartz.dart';
import 'package:ecommerce_final_task/common/constans/api_services.dart';
import 'package:ecommerce_final_task/data/models/requests/auth/login_request_model.dart';
import 'package:ecommerce_final_task/data/models/responses/auth/auth_response_model.dart';
import 'package:http/http.dart' as http;

import '../../../common/constans/variables.dart';

class AuthRemoteDatasource {
  final header = {'Content-Type': 'application/json'};
  Future<Either<String, AuthResponseModel>> login(
    LoginRequestModel model,
  ) async {
    final response = await http
        .post(
      Uri.parse(ApiServices.baseUrl + ApiServices.login),
      headers: header,
      body: model.toJson(),
    )
        .timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.http408, 408);
      },
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else if (response.statusCode == 201) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else if (response.statusCode == 400) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else if (response.statusCode == 408) {
      return const Left(Variables.http408);
    } else {
      return const Left(Variables.httpService);
    }
  }
}
