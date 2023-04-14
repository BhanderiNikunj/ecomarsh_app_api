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

    List<dynamic> productModel = json
        .map(
          (e) => ProductModel().ProductFromJson(e),
        )
        .toList();

    return productModel;
  }

  Future<bool> creatData() async {
    String Link =
        "https://apidatahub.000webhostapp.com/MyShop/API/adddataapi.php";

    Uri uri = Uri.parse(Link);

    var result = await http.post(
      uri,
      body: {
        "p_name": "Asus VivoBook",
        "p_rate": "5",
        "p_price": "70000",
        "p_offer": "10000",
        "p_desc": "Nice Leptop",
        "p_category": "Leptop",
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
