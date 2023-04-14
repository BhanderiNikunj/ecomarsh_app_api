import 'dart:convert';

import 'package:ecomarsh_app/Screen/Product/Model/HomeModel.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<List<dynamic>> ApicCall() async {
    String Link =
        "https://apidatahub.000webhostapp.com/MyShop/API/products.php";

    Uri uri = Uri.parse(Link);

    var result = await http.get(uri);

    var json = jsonDecode(result.body);

    List<dynamic> productModel = json
        .map(
          (e) => ProductModel().ProductFromJson(e),
        )
        .toList();

    return productModel;
  }

  Future<bool> creatData(String name, String rate, String price, String offer,
      String desc, String category) async {
    String Link =
        "https://apidatahub.000webhostapp.com/MyShop/API/adddataapi.php";

    Uri uri = Uri.parse(Link);

    var result = await http.post(
      uri,
      body: {
        "p_name": name,
        "p_rate": rate,
        "p_price": price,
        "p_offer": offer,
        "p_desc": desc,
        "p_category": category,
      },
    );

    if (result.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> Delate(String index) async {
    String Link =
        "https://apidatahub.000webhostapp.com/MyShop/API/deleteapi.php";

    Uri uri = Uri.parse(Link);

    var result = await http.post(uri, body: {
      "id": index,
    });

    if (result.statusCode == 200) {
      return true;
    }
    return false;
  }
}
