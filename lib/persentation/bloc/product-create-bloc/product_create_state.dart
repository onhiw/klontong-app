part of 'product_create_bloc.dart';

abstract class ProductCreateState extends Equatable {
  const ProductCreateState();
}

class ProductCreateInitial extends ProductCreateState {
  @override
  List<Object?> get props => [];
}

class ProductCreateLoading extends ProductCreateState {
  @override
  List<Object?> get props => [];
}

class ProductCreateSuccess extends ProductCreateState {
  final Product product;

  const ProductCreateSuccess(this.product);

  @override
  List<Object?> get props => [product];
}

class ProductCreateError extends ProductCreateState {
  final String message;

  const ProductCreateError(this.message);

  @override
  List<Object?> get props => [message];
}
