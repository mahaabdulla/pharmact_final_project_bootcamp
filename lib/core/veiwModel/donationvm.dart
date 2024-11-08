
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pharmcy/core/constant/api_url.dart';
import 'package:pharmcy/core/models/donation.dart';

import '../../helper/storage_helper.dart';

StorageHelper storageHelper = StorageHelper.instance;

class DonationVM with ChangeNotifier {
  List<Donation> donations = [];
  bool isLoading = false;
  String? errorMessage;
  String token = storageHelper.readKey("token");

static List<Donation> cart = []; 
 addToCart(Donation d){
    cart.add(d);
    notifyListeners();
  }

  Future<List<Donation>>getData(String url) async {
    isLoading = true;
    notifyListeners();
    Dio dio = Dio();
    final Map<String, dynamic> header = {
      "Accept" :"application/json",
      //"Content-Type" : "application/json",
      "Authorization": "Bearer $token"
    };
    try {
      Response res = await dio.get(url ,
      options:Options(headers: header) );
      List<dynamic> donation = res.data['data'];
      print(res.data['data']);
      donations = donation.map((element) => Donation.fromJson(element)).toList();
      //print(donations[1].name!);
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Error: ${e.toString()}';
      print(errorMessage);
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return donations;
  }
   Future<List<Donation>>getmydonation(String url) async {
    isLoading = true;
    notifyListeners();
    Dio dio = Dio();
    final Map<String, dynamic> header = {
      "Accept" :"application/json",
      //"Content-Type" : "application/json",
      "Authorization": "Bearer $token"
    };
    try {
      Response res = await dio.get(url ,options:Options(headers: header) );
      List<dynamic> donation = res.data["data"]["drugs"];
      //print(res.data["data"]["drugs"]);
      donations = donation.map((element) => Donation.fromJson(element)).toList();
      
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Error: ${e.toString()}';
      print(errorMessage);
    } finally {
      isLoading = false;
      notifyListeners();
    }
    return donations;
  }

  Future<void> sendDonation(Donation donation) async {
    isLoading = true;
    notifyListeners();

    Dio dio = Dio();
    try {
       Map<String,dynamic> df=await donation.medecineData() ;
       FormData formData = await FormData.fromMap(df);
      Response res = await dio.post(ApiUrls.donationUrl,data:formData,options: Options(headers: {'Authorization': 'Bearer $token'}));
        print(donation.toJson());
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
  
}

