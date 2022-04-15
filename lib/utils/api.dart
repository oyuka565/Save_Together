import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/UserList.dart';
import 'func.dart';

class APIService {
  Future<UserListResponse> userList(int userId) async {
    String url = "/users" ;
    if (userId !=0 )
      url = url + "/" + userId.toString();
    UserListResponse res = new UserListResponse(list: []);

    try {
      final headers = {"Content-type": "application/json;charset=UTF-8"};

      final response = await http.get(new Uri.http("10.0.2.2:3000", url)) ;
          //await http.post(Uri.parse(url), headers: headers,body: "");

      final jsonResp = jsonDecode(response.body);
      res = UserListResponse.fromJson(jsonResp);
      //globals.showProgress = false;
    } catch (e) {
      //globals.showProgress = false;
      print(e.toString());
    }
    return res;
  }

}
