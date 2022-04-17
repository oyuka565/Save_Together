import 'dart:convert';

import '../utils/Func.dart';

class CategoryListResponse {
  final List<CategoryResponse> list;

  CategoryListResponse({
    required this.list,
  });

  factory CategoryListResponse.fromJson(List<dynamic> parsedJson) {
    List<CategoryResponse> list; //= new List<UserResponse>();
    list = parsedJson.map((i) => CategoryResponse.fromJson(i)).toList();

    return new CategoryListResponse(list: list);
  }
}

class CategoryResponse {
  int? categoryID;
  int? parentID;
  String? title;
  String? metaTitle;
  String? slug;
  String? content;

  CategoryResponse({this.categoryID,
    this.parentID,
    this.title,
    this.metaTitle,
    this.slug,
    this.content});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    categoryID = Func.toInt(json['CategoryID']);
    parentID = Func.toInt((json['parentID'] == null? 0: json['parentID']));
    title = json['title'];
    metaTitle = json['metaTitle'];
    slug = json['slug'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CategoryID'] = this.categoryID;
    data['parentID'] = this.parentID;
    data['title'] = this.title;
    data['metaTitle'] = this.metaTitle;
    data['slug'] = this.slug;
    data['content'] = this.content;
    return data;
  }
}
