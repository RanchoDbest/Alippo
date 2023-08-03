import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_alippo/models/cart_model.dart';

import '../../repository/cart_repository.dart';



part 'cart_event.dart';
part 'cart_state.dart';


class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    final CartRepository _apiRepository = CartRepository();

    on<GetCartList>((event, emit) async {
      try {
        emit(CartLoading());
        final mList = await _apiRepository.fetchCartList();
        emit(CartLoaded(mList));
        // if (mList.error == null) {
        //   emit(CartError(mList.error));
        // }
      } on NetworkError {
        emit(CartError("Failed to fetch data. is your device online?"));
      }
    });
  }
}