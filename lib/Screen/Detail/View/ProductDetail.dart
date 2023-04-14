import 'package:ecomarsh_app/Screen/Product/Provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  ProductProvider? productProviderTrue;
  ProductProvider? productProviderFalse;

  @override
  Widget build(BuildContext context) {
    productProviderFalse = Provider.of<ProductProvider>(context, listen: false);
    productProviderTrue = Provider.of<ProductProvider>(context, listen: true);
    dynamic index = ModalRoute.of(context)!.settings.arguments;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                color: Colors.white30,
              ),
              child: Image.asset(
                "Assets/Images/Google.png",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: Text(
                "Name :- ${productProviderFalse!.product[index].p_name}",
                style: GoogleFonts.lobster(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15,top: 10),
              child: Text(
                "Price :- ${productProviderFalse!.product[index].p_price}",
                style: GoogleFonts.lobster(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: Text(
                "Offer :- ${productProviderFalse!.product[index].p_offer}",
                style: GoogleFonts.lobster(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15,top: 10),
              child: Text(
                "Description :- ${productProviderFalse!.product[index].p_desc}",
                style: GoogleFonts.lobster(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15,top: 10),
              child: Text(
                "Rate :- ${productProviderFalse!.product[index].p_rate}",
                style: GoogleFonts.lobster(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
