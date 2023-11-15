import 'package:dartz/dartz.dart';
import 'package:ecommerce_final_task/common/constans/api_services.dart';
import 'package:ecommerce_final_task/data/datasources/local_remote_datasources.dart';
import 'package:ecommerce_final_task/data/models/responses/user_address/user_address_response_model.dart';
import 'package:http/http.dart' as http;

import '../../../common/constans/variables.dart';

class UserAddressRemoteDatasource {
  final header = {'Content-Type': 'application/json'};

  Future<Either<String, UserAddressResponseModel>> getAllUserAddress() async {
    final token = await LocalDatasource().getToken();
    final response = await http.get(
      Uri.parse(ApiServices.baseUrl + ApiServices.getUserAddress),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    ).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.msgHttp408, 408);
      },
    );

    if (response.statusCode == 200) {
      return Right(UserAddressResponseModel.fromJson(response.body));
    } else if (response.statusCode == 201) {
      return Right(UserAddressResponseModel.fromJson(response.body));
    } else if (response.statusCode == 400) {
      return Right(UserAddressResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      return Right(UserAddressResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(UserAddressResponseModel.fromJson(response.body));
    } else if (response.statusCode == 408) {
      return const Left(Variables.msgHttp408);
    } else {
      return const Left(Variables.msgHttpService);
    }
  }

  Future<Either<String, UserAddressResponseModel>> getUserAddressByDefault(
    bool isDefault,
  ) async {
    final token = await LocalDatasource().getToken();
    final response = await http.get(
      Uri.parse(
          "${ApiServices.baseUrl + ApiServices.getUserAddress}%filters[is_default][$eq] = $isDefault"),
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
      return Right(UserAddressResponseModel.fromJson(response.body));
    } else if (response.statusCode == 201) {
      return Right(UserAddressResponseModel.fromJson(response.body));
    } else if (response.statusCode == 400) {
      return Right(UserAddressResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      return Right(UserAddressResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(UserAddressResponseModel.fromJson(response.body));
    } else if (response.statusCode == 408) {
      return const Left(Variables.msgHttp408);
    } else {
      return const Left(Variables.msgHttpService);
    }
  }
}
