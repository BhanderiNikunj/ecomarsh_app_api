import 'package:ecomarsh_app/Screen/Home/Provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

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
        body: Column(
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
                      homeProviderFalse!.PostApiCall();
                      Navigator.pop(context);
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
        ),
      ),
    );
  }
}
