import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../common/constans/api_services.dart';
import '../../../common/constans/variables.dart';
import '../../models/responses/user_address/city_response_model.dart';
import '../../models/responses/user_address/cost_response_model.dart';
import '../../models/responses/user_address/province_response_model.dart';
import '../../models/responses/user_address/subdistrict_response_model.dart';

class RajaOngkirRemoteDatasource {
  Future<Either<String, ProvinceResponseModel>> getProvinces() async {
    final url = Uri.parse('${ApiServices.baseUrlRajaOngkir}/province');
    final response = await http.get(
      url,
      headers: {
        'key': ApiServices.rajaOngkirKey,
      },
    ).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.msgHttp408, 408);
      },
    );

    if (response.statusCode == 200) {
      return right(ProvinceResponseModel.fromJson(response.body));
    } else if (response.statusCode == 400) {
      return Right(ProvinceResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      return Right(ProvinceResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(ProvinceResponseModel.fromJson(response.body));
    } else if (response.statusCode == 408) {
      return const Left(Variables.msgHttp408);
    } else {
      return const Left(Variables.msgHttpService);
    }
  }

  Future<Either<String, CityResponseModel>> getCities(
    String provinceId,
  ) async {
    final url =
        Uri.parse('${ApiServices.baseUrlRajaOngkir}/city?province=$provinceId');
    final response = await http.get(
      url,
      headers: {
        'key': ApiServices.rajaOngkirKey,
      },
    ).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.msgHttp408, 408);
      },
    );

    if (response.statusCode == 200) {
      return right(CityResponseModel.fromJson(response.body));
    } else if (response.statusCode == 400) {
      return Right(CityResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      return Right(CityResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(CityResponseModel.fromJson(response.body));
    } else if (response.statusCode == 408) {
      return const Left(Variables.msgHttp408);
    } else {
      return const Left(Variables.msgHttpService);
    }
  }

  Future<Either<String, SubDistrictResponseModel>> getSubDistrict(
    String cityId,
  ) async {
    final url =
        Uri.parse('${ApiServices.baseUrlRajaOngkir}/subdistrict?city=$cityId');
    final response = await http.get(
      url,
      headers: {
        'key': ApiServices.rajaOngkirKey,
      },
    ).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.msgHttp408, 408);
      },
    );

    if (response.statusCode == 200) {
      return right(SubDistrictResponseModel.fromJson(response.body));
    } else if (response.statusCode == 400) {
      return Right(SubDistrictResponseModel.fromJson(response.body));
    } else if (response.statusCode == 401) {
      return Right(SubDistrictResponseModel.fromJson(response.body));
    } else if (response.statusCode == 404) {
      return Right(SubDistrictResponseModel.fromJson(response.body));
    } else if (response.statusCode == 408) {
      return const Left(Variables.msgHttp408);
    } else {
      return const Left(Variables.msgHttpService);
    }
  }

  Future<Either<String, CostResponseModel>> getCost(
    String origin,
    String destination,
    String courier,
  ) async {
    final url = Uri.parse('${ApiServices.baseUrlRajaOngkir}/cost');
    final response = await http.post(
      url,
      headers: {
        'key': ApiServices.rajaOngkirKey,
        'content-type': 'application/x-www-form-urlencoded',
      },
      body: {
        'origin': origin,
        'originType': 'subdistrict',
        'destination': destination,
        'destinationType': 'subdistrict',
        'weight': '500',
        'courier': courier,
      },
    );

    if (response.statusCode == 200) {
      return right(CostResponseModel.fromJson(response.body));
    } else {
      return left('Error');
    }
  }
}
