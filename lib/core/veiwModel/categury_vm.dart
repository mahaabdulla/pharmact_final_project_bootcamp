import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pharmcy/core/constant/api_url.dart';
import 'package:pharmcy/core/models/catgury.dart';

import 'donationvm.dart';

class CateguryVM with ChangeNotifier {
  List<Categury> allCategury = [];
  bool isLoading = true;
  String? errorMessage;

  CateguryVM() { ///////// ايش الهدف
    getData();
  }

void getData() async {
    isLoading = true;
    notifyListeners();
    Dio dio = Dio();

     String authToken = storageHelper.readKey("token");

    final Map<String, dynamic> header = {
      "Accept" :"application/json",
      "Content-Type" : "application/json",
      "Authorization": "Bearer $authToken"
    };
    try {
      Response res = await dio.get(ApiUrls.allCategurys ,
      options:Options(headers: header) );

      List<dynamic> allCategories = res.data['data'];
      allCategury = allCategories.map((element) => Categury.fromJson(element)).toList();
      print(allCategury);
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Error: ${e.toString()}';
      print(errorMessage);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}