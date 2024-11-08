
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pharmcy/core/models/drugRequest.dart';
import 'package:pharmcy/core/veiwModel/donationvm.dart';

import '../constant/api_url.dart';
class DruqRequestVM with ChangeNotifier{
  bool isLoading = false;
  String? errorMessage;
  String token = storageHelper.readKey("token");
  int? user_id=int.parse(storageHelper.readKey("id"));
  List<DrugRequest>allDrugs=[];
  
  Future<void> sendDrug(List<Map<String,int>> drug) async {
    //print(drug);
    isLoading = true;
    notifyListeners();

    Dio dio = Dio();
    try {
      FormData formData=FormData.fromMap({

        "drugs":jsonEncode(drug)
      });
      Response res = await dio.post(ApiUrls.requestDrug,data: formData,options: Options(headers: {'Authorization': 'Bearer $token',"Accept" :"application/json","Content-Type" : "multipart/form-data"}));
      if (res.statusCode == 200) {
        print('Sucsses');
        //donations.add(donation);
        errorMessage = null;
      } else {
        errorMessage = 'فشل في إرسال البيانات';
      }
    } catch (e) {
      errorMessage = 'حدث خطأ أثناء إرسال البيانات: $e';
      print('Exception is $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  
  Future<List<DrugRequest>>getDrug(String url) async {
    isLoading = true;
    notifyListeners();
    Dio dio = Dio();
    final Map<String, dynamic> header = {
      "Accept" :"application/json",
      //"Content-Type" : "application/json",
      "Authorization": "Bearer $token"
    };
    try {
      Response res = await dio.get(url,options:Options(headers: header) );
      List<dynamic> alluserDrugs = res.data['data'];
      List<dynamic> oneUser = alluserDrugs.where((element) => element['id']== user_id).toList();
      print(oneUser);
      List<dynamic> requests = oneUser[0]['requests'];
      allDrugs = requests.map((element) => DrugRequest.fromJson(element)).toList();
      //print(donations[1].name!);
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Error: ${e.toString()}';
      print(errorMessage);
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return allDrugs;
  }
  


}