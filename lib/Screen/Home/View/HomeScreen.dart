import 'package:ecomarsh_app/Screen/Home/Model/HomeModel.dart';
import 'package:ecomarsh_app/Screen/Home/Provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                      color: Colors.black26,
                      child: Column(
                        children: [
                          Image.network(
                            "https://cdn.telanganatoday.com/wp-content/uploads/2022/04/Google-multisearch-tool-to-help-users-search-with-photos.jpg",
                            height: 100,
                            width: 100,
                          ),
                          Text("${productModel[index].p_name}",style: TextStyle(color: Colors.black,]),),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
