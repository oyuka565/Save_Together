import 'dart:convert';

import '../utils/Func.dart';

class ProductListResponse {
  final List<ProductResponse> list;

  ProductListResponse({
    required this.list,
  });

  factory ProductListResponse.fromJson(List<dynamic> parsedJson) {
    List<ProductResponse> list;//= new List<UserResponse>();
    list = parsedJson.map((i) => ProductResponse.fromJson(i)).toList();

    return new ProductListResponse(list: list);
  }
}
class ProductResponse {
  int? productID;
  String? userID;
  String? prodcutTitle;
  String? metaTitle;
  String? summary;
  int? productPrice;
  int? discount;
  int? quantity;
  int? groupQty;
  int? currentOrderQty;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  DateTime? startsAt;
  DateTime? endsAt;
  String? content;
  String? serialNo;

  ProductResponse(
      {this.productID,
        this.userID,
        this.prodcutTitle,
        this.metaTitle,
        this.summary,
        this.productPrice,
        this.discount,
        this.quantity,
        this.groupQty,
        this.currentOrderQty,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.publishedAt,
        this.startsAt,
        this.endsAt,
        this.content,
        this.serialNo});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    productID = json['ProductID'];
    userID = json['User_ID'];
    prodcutTitle = json['prodcut_title'];
    metaTitle = json['metaTitle'];
    summary = json['summary'];
    productPrice = json['product_price'];
    discount = json['discount'];
    quantity = json['quantity'];
    groupQty = json['group_qty'];
    currentOrderQty = json['current_order_qty'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    publishedAt = json['publishedAt'];
    startsAt = json['startsAt'];
    endsAt = json['endsAt'];
    content = json['content'];
    serialNo = json['serial_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductID'] = this.productID;
    data['User_ID'] = this.userID;
    data['prodcut_title'] = this.prodcutTitle;
    data['metaTitle'] = this.metaTitle;
    data['summary'] = this.summary;
    data['product_price'] = this.productPrice;
    data['discount'] = this.discount;
    data['quantity'] = this.quantity;
    data['group_qty'] = this.groupQty;
    data['current_order_qty'] = this.currentOrderQty;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['publishedAt'] = this.publishedAt;
    data['startsAt'] = this.startsAt;
    data['endsAt'] = this.endsAt;
    data['content'] = this.content;
    data['serial_no'] = this.serialNo;
    return data;
  }
}
