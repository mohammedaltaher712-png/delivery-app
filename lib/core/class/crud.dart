import 'dart:convert';

import 'package:dartz/dartz.dart';



import 'package:http/http.dart' as http;
import 'package:order_delivery_application/core/class/statusrequest.dart';
import 'package:order_delivery_application/core/functions/checkinternet.dart';




class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkapi, Map data) async {
    try {
      if (await chekInternet()) {
        var response = await http.post(Uri.parse(linkapi), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
  
  Future<Either<StatusRequest, Map>> postDatas(String linkapi, Map data, String token) async {
  try {
    if (await chekInternet()) {
      var response = await http.post(
        Uri.parse(linkapi),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token', // إضافة التوكن هنا
        },
        body: data,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  } catch (_) {
    return const Left(StatusRequest.serverfailure);
  }
}
}
