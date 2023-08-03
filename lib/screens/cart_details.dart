import 'package:flutter/material.dart';
import 'package:task_alippo/models/cart_model.dart';

class CartDetails extends StatelessWidget {
  final CartModel cartModel;
  final int id;
  const CartDetails({required this.cartModel, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Cart - " +"${cartModel.carts[id].id}" )
      ) ,
      body: _buildCartDetails(cartModel, id),
    );
  }

  Widget _buildCartDetails(CartModel cartModel, int index){
    return Container(
      margin: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [


            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),

              itemCount: cartModel.carts[index].products.length,
                itemBuilder: (context,pIndex){
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(

                    children: [
                      Text("${cartModel.carts[index].products[pIndex].title}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),),
                      Text("Quantity : " + "${cartModel.carts[index].products[pIndex].quantity}",style: TextStyle(fontSize: 18,)),
                      Text("Price : " + "${cartModel.carts[index].products[pIndex].price}",style: TextStyle(fontSize: 18,)),
                      SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Column(children: [
                          Text("Total Price", style: TextStyle(fontSize: 18),),
                          Text("\$"+"${cartModel.carts[index].products[pIndex].total}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                        ],),
                        Column(children: [
                          Text("Discount Price"),
                          Text("\$"+"${cartModel.carts[index].products[pIndex].discountedPrice}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                        ],)
                      ],)

                    ],


                  ),
                ),
              );
            }),
            Container(
                color: Colors.deepPurple,
                padding: EdgeInsets.all(8.0),
                child: Center(child: Column(
                  children: [
                    Text("Total Price : "+ "\$"+ "${cartModel.carts[index].total}", style: TextStyle(color: Colors.white, fontSize: 20),),
                    Text("Discounted Price : "+ "\$"+ "${cartModel.carts[index].discountedTotal}", style: TextStyle(color: Colors.white, fontSize: 20),),
                    Text("Total Products : "+ "${cartModel.carts[index].totalProducts}", style: TextStyle(color: Colors.white, fontSize: 20),),
                    Text("Total Quantity : "+ "${cartModel.carts[index].totalQuantity}", style: TextStyle(color: Colors.white, fontSize: 20),),
                  ],
                ))),




          ],
        ),
      ),
    );
  }
}
