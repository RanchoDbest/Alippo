import 'package:task_alippo/repository/api_provider.dart';

import '../models/product_model.dart';

class ProductRepository{
  final _provider = ApiProvider();

  Future<ProductModel> fetchProductList() {
    return _provider.fetchProductList();
  }
}
class NetworkError extends Error {}
