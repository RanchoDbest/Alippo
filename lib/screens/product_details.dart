import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel productModel;
  final int id;
  const ProductDetails({required this.productModel, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productModel.products[id].title),
      ),
      body:buildDetails(productModel,id),
    );
  }

  Widget buildDetails(ProductModel model, int index){
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(model.products![index].thumbnail,
              width: double.infinity,
              height: 200,
              fit:BoxFit.fitWidth),

          Text("Price : "+ "\$" +"${model.products![index].price}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text("Rating : " + "${model.products![index].rating}", style: TextStyle(fontSize: 15),),
          SizedBox(height: 10,),

          Text("Stock : " + "${model.products![index].stock}", style: TextStyle(fontSize: 15),),
          SizedBox(height: 10,),

          Text("brand : " + "${model.products![index].brand}", style: TextStyle(fontSize: 15),),

        ],
      ),
    );
  }
}
