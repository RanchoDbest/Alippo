import 'package:flutter/material.dart';
import 'package:task_alippo/screens/cart.dart';
import 'package:task_alippo/screens/products.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(

          appBar: AppBar(
            title: Text('Alippo'),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [

                Tab( text: "Products"),
                Tab( text: "Cart")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Products(),
              Cart(),
            ],
          ),
        ),
      ),
    );
  }



}