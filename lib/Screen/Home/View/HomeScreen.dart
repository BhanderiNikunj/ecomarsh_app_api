import 'package:ecomarsh_app/Screen/Home/Provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtid = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txtoffer = TextEditingController();
  TextEditingController txtcate = TextEditingController();
  TextEditingController txtimg = TextEditingController();
  TextEditingController txtdesc = TextEditingController();
  TextEditingController txtrate = TextEditingController();

  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  Widget build(BuildContext context) {
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          // future: homeProviderFalse!.product,
          future: homeProviderFalse!.ProductApiCall(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(
                  "===========================================================================${snapshot.error}");
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              // List<ProductModel>? product = snapshot.data;

              List<dynamic>? productModel = snapshot.data;

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: productModel!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black26,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Image.network(
                            //   "https://cdn.telanganatoday.com/wp-content/uploads/2022/04/Google-multisearch-tool-to-help-users-search-with-photos.jpg",
                            //   height: 100,
                            //   width: 100,
                            // ),
                            Text(
                              "Name :- ${productModel[index].p_name}",
                              style: GoogleFonts.lobster(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Price :- ${productModel[index].p_price}",
                              style: GoogleFonts.lobster(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "Offer :- ${productModel[index].p_offer}",
                              style: GoogleFonts.lobster(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
              // return ListView.builder(
              //   itemBuilder: (context, index) {
              //     return Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Container(
              //         height: 150,width: double.infinity,
              //         decoration: BoxDecoration(
              //           color: Colors.black12,
              //           borderRadius: BorderRadius.circular(15),
              //           border: Border.all(color: Colors.black),
              //         ),
              //       ),
              //     );
              //   },
              //   itemCount: productModel!.length,
              // );
            }
            return CircularProgressIndicator();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            return showAboutDialog(
              context: context,
              children: [
                TextField(
                  controller: txtid,
                  decoration: InputDecoration(
                    hintText: "id",
                  ),
                ),
                TextField(
                  controller: txtname,
                  decoration: InputDecoration(
                    hintText: "name",
                  ),
                ),
                TextField(
                  controller: txtprice,
                  decoration: InputDecoration(
                    hintText: "price",
                  ),
                ),
                TextField(
                  controller: txtoffer,
                  decoration: InputDecoration(
                    hintText: "offer",
                  ),
                ),
                TextField(
                  controller: txtcate,
                  decoration: InputDecoration(
                    hintText: "category",
                  ),
                ),
                TextField(
                  controller: txtimg,
                  decoration: InputDecoration(
                    hintText: "image",
                  ),
                ),
                TextField(
                  controller: txtdesc,
                  decoration: InputDecoration(
                    hintText: "Doctument",
                  ),
                ),
                TextField(
                  controller: txtrate,
                  decoration: InputDecoration(
                    hintText: "rate",
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {

                      },
                      child: Text("Submit"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Cancel"),
                    ),
                  ],
                ),
              ],
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
