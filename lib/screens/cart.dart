import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_alippo/models/cart_model.dart';
import 'package:task_alippo/screens/cart_details.dart';

import '../blocs/cart_bloc/cart_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc _cartBloc = CartBloc();

  @override
  void initState() {
    // TODO: implement initState
    _cartBloc.add(GetCartList());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cartList()
    );
  }

  Widget _cartList(){
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _cartBloc,
        child: BlocListener<CartBloc, CartState>(
          listener: (context, state){
            if(state is CartError){
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
            content: Text(state.message!),),
              );
            }
          },
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state){
              if(state is CartInitial){
                return _buildLoading();
              }else if( state is CartLoading){
                return _buildLoading();
                }else if (state is CartLoaded){
                return _buildCard(context,state.cartModel );
              } else if (state is CartError) {
              return Container();
              } else {
              return Container();
              }


            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, CartModel model) {
    return ListView.builder(
      itemCount: model.carts.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return CartDetails(cartModel: model, id: index);
                }));
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(

              margin: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Cart Id : " +"${model.carts![index].id}", style: TextStyle(fontSize: 15),),
                  SizedBox(height: 10,),
                  Text("UserId :"+ " ${model.carts![index].userId}", style: TextStyle(fontSize: 15, ),),
                  SizedBox(height: 10,),

                    Text("Total Products : "+"${model.carts![index].products.length}",style: TextStyle(fontSize: 15), ),
                    SizedBox(height: 10,),

                    Text("Total :"+ " \$"+" ${model.carts![index].total}", style: TextStyle(fontSize: 15),),




                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

}
