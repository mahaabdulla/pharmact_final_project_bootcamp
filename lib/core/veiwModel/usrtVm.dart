import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pharmcy/core/veiwModel/donationvm.dart';
import 'package:pharmcy/helper/apiExption.dart';
import 'package:pharmcy/helper/http_helper.dart';
import 'package:pharmcy/helper/storage_helper.dart';
import '../constant/api_url.dart';
import '../models/user.dart';

/*class UserVm with ChangeNotifier {
  UserVm() {
    getProfile();
  }
 String token = storageHelper. readKey("token");
  Map<String, dynamic> profileInfo = {};
  bool isLoading = true;
  String? errorMessage;

  Future<String?> register(User user, String url) async {
    try {
      HttpHelper http = HttpHelper.instance;
      Response res = await http.postRequest(url: url, data: user.authData());
      print(res.data['data']);
      User u = User.fromJson(res.data['data']);
      print(u.email);
      print(u.name);
      print(u.token);
      print(u.id);
      saveUser(u);
      return "secssed";
    } on DioException catch (x) {
      return ApiException.handleException(x);
    } catch (e) {
      print(e);
      return "anuther exception $e";
    }
  }

  Future<String?> login(User user, String url) async {
    try {
      HttpHelper http = HttpHelper.instance;
      Response res = await http.postRequest(url: url, data: user.loginData());
      User u = User.fromJson(res.data['data']);
      print(u.email);
      print(u.name);
      print(u.token);
      print(u.id);
      saveUser(u);
      return "secssed";
    } on DioException catch (x) {
      return ApiException.handleException(x);
    } catch (e) {
      print(e);
      return "anuther exception";
    }
  }

  
  Future<String?> getProfile() async {
    isLoading = true;
    notifyListeners();
    Dio dio = Dio();
   // String authToken = '146|z9ScSywHtv7EX2DfvOhsJBj7VuHuKApjSAKRxICP5cc7b21c';

    final Map<String, dynamic> header = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    try {
      Response res =
          await dio.get(ApiUrls.profileUrl, options: Options(headers: header));

      if (res.data['user'] != null) {
        profileInfo = res.data['user'];
        errorMessage = null;
        return "Success";
      } else {
        errorMessage = 'No user data found';
        return "No data";
      }
    } catch (e) {
      errorMessage = 'Error: ${e.toString()}';
      print(errorMessage);
      return "Error";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  saveUser(User u) {
    StorageHelper storageHelper = StorageHelper.instance;

    storageHelper.writeKey("token", u.token!);
    storageHelper.writeKey("email", u.email!);
    storageHelper.writeKey("name", u.name!);
    storageHelper.writeKey("id", u.id.toString());
  }

}*/
class UserVm with ChangeNotifier {
  UserVm() {
    getProfile();
  }
 
  Map<String, dynamic> profileInfo = {};
  bool isLoading = true;
  String? errorMessage;
  Future<String?> register(User user, String url) async {
    try {
      HttpHelper http = HttpHelper.instance;
      Response res = await http.postRequest(url: url, data: user.authData());
      print(res.data['data']);
      User u = User.fromJson(res.data['data']);
      print(u.email);
      print(u.name);
      print(u.token);
      print(u.id);
      saveUser(u);
      return "secssed";
    } on DioException catch (x) {
      return ApiException.handleException(x);
    } catch (e) {
      print(e);
      return "anuther exception $e";
    }
  }

  Future<String?> login(User user, String url) async {
    try {
      HttpHelper http = HttpHelper.instance;
      Response res = await http.postRequest(url: url, data: user.loginData());
      User u = User.fromJson(res.data['data']);
      print(u.email);
      print(u.name);
      print(u.token);
      print(u.id);
      saveUser(u);
      return "secssed";
    } on DioException catch (x) {
      return ApiException.handleException(x);
    } catch (e) {
      print(e);
      return "anuther exception";
    }
  }

  
  Future<String?> getProfile() async {

   late String token ;
    storageHelper. readKey("token") == null?token='434|3KDzaCJf4LMXiZlMAc7pZWNj8moyQrgEx4oHOTqv24fe2d5a':token=storageHelper. readKey("token");
    isLoading = true;
    notifyListeners();
    Dio dio = Dio();
   // String authToken = '146|z9ScSywHtv7EX2DfvOhsJBj7VuHuKApjSAKRxICP5cc7b21c';

    final Map<String, dynamic> header = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    try {
      Response res =
          await dio.get(ApiUrls.profileUrl, options: Options(headers: header));

      if (res.data['user'] != null) {
        profileInfo = res.data['user'];
        errorMessage = null;
        return "Success";
      } else {
        errorMessage = 'No user data found';
        return "No data";
      }
    } catch (e) {
      errorMessage = 'Error: ${e.toString()}';
      print(errorMessage);
      return "Error";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  Future<String?> updateProfile(Map<String,dynamic> data, String url) async {
    String token = storageHelper. readKey("token");
    isLoading = true;
    notifyListeners();
    try {
     // String authToken = await StorageHelper.instance.readKey("token");
      final Map<String, dynamic> header = {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };
      HttpHelper http = HttpHelper.instance;
      Response res = await http.postRequest(
        url: ApiUrls.postProfile,
        data: data,
        options: Options(headers: header),
      );
     print(res) ;
      return "success";
    } on DioException catch (x) {
      return ApiException.handleException(x);
    } catch (e) {
      print(e);
      return "another exception";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  saveUser(User u) {
    StorageHelper storageHelper = StorageHelper.instance;

    storageHelper.writeKey("token", u.token!);
    storageHelper.writeKey("email", u.email!);
    storageHelper.writeKey("name", u.name!);
    storageHelper.writeKey("id", u.id.toString());
  }

}


