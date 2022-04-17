import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:together_app/model/ProdModel.dart';

import '../model/CategoryResponse.dart';
import '../model/UserList.dart';
import 'func.dart';
import 'package:together_app/utils/globals.dart' as globals;

class APIService {
  Future<UserListResponse> userList(int userId) async {
    String url = "/prods";
    if (userId != 0) url = url + "/" + userId.toString();
    UserListResponse res = new UserListResponse(list: []);

    try {
      final response = await http.get(new Uri.http(globals.apiURL, url));
      //await http.post(Uri.parse(url), headers: headers,body: "");
      if (response.statusCode == 200) {
        final jsonResp = jsonDecode(response.body);
        res = UserListResponse.fromJson(jsonResp);
      }
    } catch (e) {
      //
      print(e.toString());
    } finally {
      globals.showProgress = false;
    }
    return res;
  }

  Future<ProductListResponse> prodList(int prodId) async {
    String url = "/prods";
    if (prodId != 0) url = url + "/" + prodId.toString();
    ProductListResponse res = new ProductListResponse(list: []);

    try {
      final response = await http.get(new Uri.http(globals.apiURL, url));
      //await http.post(Uri.parse(url), headers: headers,body: "");
      if (response.statusCode == 200) {
        final jsonResp = jsonDecode(response.body);
        res = ProductListResponse.fromJson(jsonResp);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      globals.showProgress = false;
    }
    return res;
  }

  Future<CategoryListResponse> categoryList() async {
    String url = "/category";
    CategoryListResponse res = new CategoryListResponse(list: []);

    try {
      final headers = {"Content-type": "application/json;charset=UTF-8"};
      final response = await http.get(new Uri.http(globals.apiURL, url));
      //await http.post(Uri.parse(url), headers: headers,body: "");
      if (response.statusCode == 200) {
        final jsonResp = jsonDecode(response.body);
        res = CategoryListResponse.fromJson(jsonResp);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      globals.showProgress = false;
    }
    return res;
  }

  Future<bool> saveProdInfo(ProductModel prod, bool isEdit) async {
    bool result = false;
    String urlProd = "/saveProd";
    if (isEdit) urlProd = urlProd + "/" + prod.productID.toString();

    try {
      var url = Uri.http(globals.apiURL, urlProd);

      var requestMethod = isEdit ? "PUT" : "POST";
      var request = http.MultipartRequest(requestMethod, url);

/*      if (!isEdit)
        request.fields["User_id"] = globals.userId;
      request.fields["prodcut_title"] = prod.prodcutTitle!;
      request.fields["summary"] = prod.summary!;
      request.fields["product_price"] = Func.toStr(prod.productPrice!);
      request.fields["discount"] = Func.toStr(prod.discount!);
      request.fields["quantity"] = Func.toStr(prod.quantity!);
      request.fields["group_qty"] = Func.toStr(prod.groupQty!);
      request.fields["content"] = prod.content!;
      request.fields["serial_no"] = prod.serialNo!;
      request.fields["image_path"] = prod.imagePath!;
      var response = await request.send();*/
      final headers = {"Content-type": "application/json;charset=UTF-8"};
      var response;
      if (isEdit)
        response = await http.put(
          new Uri.http(globals.apiURL, urlProd),
          headers: headers,
          body: jsonEncode(<String, String>{
            'ProductId': Func.toStr(prod.productID!),
            'User_ID': globals.userId,
            'prodcut_title': prod.prodcutTitle!,
            'metaTitle': prod.prodcutTitle!,
            'summary': prod.summary!,
            'product_price': Func.toStr(prod.productPrice!),
            'discount': Func.toStr(prod.discount!),
            'quantity': Func.toStr(prod.quantity!),
            'group_qty': Func.toStr(prod.groupQty!),
            'status': "1",
            'content': prod.content!,
            'serial_no': prod.serialNo!,
            'image_url': prod.imageUrl!
          }),
        );
      else
        response = await http.post(
          new Uri.http(globals.apiURL, urlProd),
          headers: headers,
          body: jsonEncode(<String, String>{
            'ProductId': Func.toStr(prod.productID!),
            'User_ID': globals.userId,
            'prodcut_title': prod.prodcutTitle!,
            'metaTitle': prod.prodcutTitle!,
            'summary': prod.summary!,
            'product_price': Func.toStr(prod.productPrice!),
            'discount': Func.toStr(prod.discount!),
            'quantity': Func.toStr(prod.quantity!),
            'group_qty': Func.toStr(prod.groupQty!),
            'status': "1",
            'content': prod.content!,
            'serial_no': prod.serialNo!,
            'image_url': prod.imageUrl!
          }),
        );
      if (response.statusCode == 200) {
        result = true;
      }
    } catch (e) {
      print(e.toString());
    } finally {
      globals.showProgress = false;
    }
    return result;
  }
}
