part of 'product_bloc.dart';


abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props =>[];

}

class ProductInitial extends ProductState{}

class ProductLoading extends ProductState{}

class ProductLoaded extends ProductState {
  final ProductModel productModel;
  const ProductLoaded(this.productModel);
}

class ProductError extends ProductState{
  final String message;
  const ProductError(this.message);
}