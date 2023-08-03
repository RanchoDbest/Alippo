part of 'cart_bloc.dart';
abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props =>[];

}

class CartInitial extends CartState{}

class CartLoading extends CartState{}

class CartLoaded extends CartState {
  final CartModel cartModel;
  const CartLoaded(this.cartModel);
}

class CartError extends CartState{
  final String message;
  const CartError(this.message);
}
