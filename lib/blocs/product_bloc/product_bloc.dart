import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_alippo/models/product_model.dart';

import '../../repository/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    final ProductRepository _apiRepository = ProductRepository();

    on<GetProductList>((event, emit) async {
      try {
        emit(ProductLoading());
        final mList = await _apiRepository.fetchProductList();
        emit(ProductLoaded(mList));
        // if (mList.error == null) {
        //   emit(ProductError(mList.error));
        // }
      } on NetworkError {
        emit(ProductError("Failed to fetch data. is your device online?"));
      }
    });
  }
}