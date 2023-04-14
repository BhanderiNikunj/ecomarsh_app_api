import 'package:ecomarsh_app/Screen/Product/Provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductProvider? productProviderTrue;
  ProductProvider? productProviderFalse;

  @override
  Widget build(BuildContext context) {
    productProviderFalse = Provider.of<ProductProvider>(context, listen: false);
    productProviderTrue = Provider.of<ProductProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
          future: productProviderFalse!.ProductApiCall(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List<dynamic>? productModel = snapshot.data;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: productModel!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'detail',
                            arguments: index);
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white30,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () {
                                    productProviderFalse!.delate(
                                        productModel[index].p_id, context);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "Assets/Images/Google.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Name :- ${productModel[index].p_name}",
                                    style: GoogleFonts.lobster(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Price :- ${productModel[index].p_price}",
                                    style: GoogleFonts.lobster(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.orange,
                color: Colors.white,
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () {
            Navigator.pushNamed(context, 'add');
          },
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
