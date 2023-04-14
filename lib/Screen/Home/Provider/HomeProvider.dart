import 'package:ecomarsh_app/Utiles/ApiHelper.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier
{
    List<dynamic> product = [];

    Future<List<dynamic>> ProductApiCall() async {
      ApiHelper apiHelper = ApiHelper();
      List<dynamic> productModel = await apiHelper.ApicCall();
      product = productModel;
      return product;
    }

    Future<void> PostApiCall() async {
      ApiHelper apiHelper = ApiHelper();
      bool data = await apiHelper.creatData();
      notifyListeners();
      if(data == true)
        {
          print("Success");
        }
      else
        {
          print("Fail");
        }
    }


    Future<void> delate(String index,BuildContext context) async {
      ApiHelper apiHelper = ApiHelper();
      bool data = await apiHelper.Delate(index);
      notifyListeners();
      if(data)
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Delete Success")));
        }
      else
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Delete Failed")));
        }
    }
}