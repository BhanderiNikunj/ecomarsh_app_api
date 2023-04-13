import 'dart:convert';

import 'package:ecomarsh_app/Screen/Home/Model/HomeModel.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<List<dynamic>> ApicCall() async {
    String Link =
        "https://apidatahub.000webhostapp.com/MyShop/API/products.php";

    Uri uri = Uri.parse(Link);

    var result = await http.get(uri);

    var json = jsonDecode(result.body);

    print(json);

    List<dynamic> productModel = json.map((e) => ProductModel().ProductFromJson(e),).toList();

    return productModel;
  }
}
