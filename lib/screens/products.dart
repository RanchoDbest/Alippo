import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_alippo/screens/product_details.dart';

import '../blocs/product_bloc/product_bloc.dart';
import '../models/product_model.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final ProductBloc _productBloc = ProductBloc();

  @override
  void initState() {
    // TODO: implement initState
    _productBloc.add(GetProductList());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _productList(),);
  }

  Widget _productList() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _productBloc,
        child: BlocListener<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductInitial) {
                return _buildLoading();
              } else if (state is ProductLoading) {
                return _buildLoading();
              } else

                if (state is ProductLoaded) {
                return _buildCard(context, state.productModel);
              } else if (state is ProductError) {
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

  Widget _buildCard(BuildContext context, ProductModel model) {
    return ListView.builder(
      itemCount: model.products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
Navigator.push(context,
                MaterialPageRoute(builder: (context) {
              return ProductDetails(productModel: model, id: index);
            }));
          },
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(

              child: Column(
                children: <Widget>[

                  Container(
                    width: double.maxFinite,
                    color: Colors.deepPurple,
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: Text("${model.products![index].title}", style: TextStyle(color: Colors.white, fontSize: 20),))),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                    Image.network(model.products![index].thumbnail,
                        width: 150,
                        height: 200,
                        fit:BoxFit.fitHeight),
                    SizedBox(width: 5,),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text("${model.products![index].description}",overflow: TextOverflow.ellipsis,maxLines: 5,style: TextStyle(fontSize: 15), ),
                          SizedBox(height: 10,),
                          Text("Price : "+ "\$" +"${model.products![index].price}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("Discount percentage :"+ " ${model.products![index].discountPercentage}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                        ],
                      ),
                    )
                  ],),

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
