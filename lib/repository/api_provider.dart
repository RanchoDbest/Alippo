import 'package:dio/dio.dart';
import 'package:task_alippo/models/product_model.dart';

import '../models/cart_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://dummyjson.com/products';

  Future<ProductModel> fetchProductList() async {
    try {
      Response response = await _dio.get(_url);

      return ProductModel.fromJson(response.data);
    } catch (error, stacktrace) {
      return ProductModel(error: 'Data cannot be fetched', products: []);
    }
  }
}

class CartApiProvider {

  final Dio _dio = Dio();
  final String _url = 'https://dummyjson.com/carts';

  Future<CartModel> fetchCartList() async {
    try {
      Response response = await _dio.get(_url);

      return CartModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CartModel(error: 'Data cannot be fetched', carts: [], total: 0,skip: 0,limit: 0 );
    }
  }
}
