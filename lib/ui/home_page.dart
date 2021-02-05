import 'package:first_project/core/bloc/product/product_bloc.dart';
import 'package:first_project/core/bloc/product/product_event.dart';
import 'package:first_project/core/bloc/product/product_state.dart';
import 'package:first_project/core/model/product_model.dart';
import 'package:first_project/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var bloc = ProductBloc();
  var products = <Product>[];

  @override
  void initState() {
    print("ASDA");
    bloc.add(LoadProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: bloc,
      listener: (context, state) {
        if(state is ProductsLoaded) {
          print("LOADED DATA");
          print(state.data);
          setState(() {
            products = state.data;
          });
        }
        else if(state is ProductFailure) {
          Toast.show(state.error, context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          actions: [
            IconButton(
              icon: Icon(Icons.people, color: Colors.white), 
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) => LoginPage()
              ))
            )
          ],
        ),
        body: ListView.separated(
          itemCount: products.length,
          separatorBuilder: (context, index) => Divider(height: 6, color: Colors.grey),
          itemBuilder: (context, index) => ProductItem(),
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/mouse.jpg",
            width: 100,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mouse Game GAME",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                "Rp 10.000",
                style: TextStyle(
                  fontSize: 18
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}