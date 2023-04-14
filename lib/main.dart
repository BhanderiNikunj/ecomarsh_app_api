import 'package:ecomarsh_app/Screen/AddData/View/AddData.dart';
import 'package:ecomarsh_app/Screen/Detail/View/ProductDetail.dart';
import 'package:ecomarsh_app/Screen/Product/Provider/HomeProvider.dart';
import 'package:ecomarsh_app/Screen/Product/View/HomeScreen.dart';
import 'package:ecomarsh_app/Screen/Sples/View/SpleshScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SpleshScreen(),
          'product': (context) => const ProductScreen(),
          'add': (context) => const AddData(),
          'detail': (context) => const ProductDetail(),
        },
      ),
    ),
  );
}
