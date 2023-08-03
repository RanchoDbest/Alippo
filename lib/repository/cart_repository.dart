import 'package:task_alippo/repository/api_provider.dart';

import '../models/cart_model.dart';

class CartRepository{
  final _cartProvider = CartApiProvider();
  Future<CartModel> fetchCartList() {
    return _cartProvider.fetchCartList();
  }
}

class NetworkError extends Error {}