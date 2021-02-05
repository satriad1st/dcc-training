import 'package:first_project/core/bloc/product/product_bloc.dart';
import 'package:first_project/core/bloc/product/product_event.dart';
import 'package:first_project/core/bloc/product/product_state.dart';
import 'package:first_project/core/model/product_model.dart';
import 'package:first_project/helper/shared_pref_helper.dart';
import 'package:first_project/ui/admin/category/home_admin.dart';
import 'package:first_project/ui/login_page.dart';
import 'package:first_project/ui/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var isAuthenticated = false;
  var bloc = ProductBloc();
  var products = <Product>[];

  @override
  void initState() {
    start();
    bloc.add(LoadProducts());
    super.initState();
  }

  start () async {
    setState(() async {
      print("isAuthenticated2");
      print(isAuthenticated);
      isAuthenticated = await SharedPreferencesHelper.isAuthenticated();
      print("isAuthenticated2");
      print(isAuthenticated);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: bloc,
      listener: (context, state) {
        if(state is ProductsLoaded) {
          setState(() {
            products = state.data;
          });
        } else if (state is ProductFailure) {
          Toast.show(state.error, context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("HOME"),
          actions: [
            IconButton(
              icon: Icon(Icons.people), 
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) => isAuthenticated ? HomeAdminPage() : LoginPage()
              )).then((value) => SharedPreferencesHelper.isAuthenticated().then((value) => setState(() => isAuthenticated = value)))
            )
          ],
        ),
        body: ListView.separated(
          itemCount: products.length,
          separatorBuilder: (context, index) => Divider(), 
          itemBuilder: (context, index) {
            return ProductItem(product: products[index]);
          }, 
        ),
      ),
    );
  }
}