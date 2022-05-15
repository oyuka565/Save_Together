import 'dart:convert';

import '../utils/Func.dart';

class favoriteItemListResponse {
  final List<favoriteModel> list;

  favoriteItemListResponse({
    required this.list,
  });

  factory favoriteItemListResponse.fromJson(List<dynamic> parsedJson) {
    List<favoriteModel> list;//= new List<UserResponse>();
    list = parsedJson.map((i) => favoriteModel.fromJson(i)).toList();

    return new favoriteItemListResponse(list: list);
  }
}

class favoriteModel {
  String? iD;
  int? productID;
  String? content;
  int? price;
  String? imageUrl;


  favoriteModel(
      {this.iD,
        this.productID,
        this.price,
        this.content,
        this.imageUrl});

  favoriteModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    productID = json['ProductID'];
    price = json['price'];
    content = json['content'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['ProductID'] = this.productID;
    data['price'] = this.price;
    data['content'] = this.content;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
