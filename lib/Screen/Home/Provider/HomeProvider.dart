import 'package:ecomarsh_app/Screen/Home/Model/HomeModel.dart';
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
}