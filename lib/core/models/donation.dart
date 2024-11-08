import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class Donation {
  String? name;
  int? quantity;
  int? category_id;
  String? shape;
  String? type;
  String? expireDate;
  int? userId;
  String? updatedAt;
  String? createdAt;
  XFile? image;
  int? id;
String? status;

  Donation(
      {this.name,
      this.quantity,
      this.shape,
      this.type,
      this.expireDate,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.image,
      this.status,
      this.category_id,
      });

  Donation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    shape = json['shape'];
    type = json['type'];
    expireDate = json['expire_date'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    category_id = json['category_id'];
    image =XFile(json['image']) ;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['shape'] = this.shape;
    data['type'] = this.type;
    data['expire_date'] = this.expireDate;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['image'] = this.image;
    data['category_id'] = this.category_id;
    data['status'] = this.status;
    return data;
  }
  Future< Map<String,dynamic>> medecineData()async{
      Map<String,dynamic> SerData= {};
      SerData["name"]=name!;
      SerData["quantity"]=quantity!;
      SerData["shape"]=shape!;
      SerData["type"]=type!;
      SerData["expireDate"]=expireDate!;
      if(image!=null)
      SerData["image"] = await MultipartFile.fromFile(image!.path);
      return SerData;
    }
}
