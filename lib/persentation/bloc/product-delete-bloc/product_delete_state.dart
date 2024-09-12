part of 'product_delete_bloc.dart';

sealed class ProductDeleteState extends Equatable {
  const ProductDeleteState();
}

class ProductDeleteInitial extends ProductDeleteState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ProductDeleteLoading extends ProductDeleteState {
  @override
  List<Object?> get props => [];
}

class ProductDeleteSuccess extends ProductDeleteState {
  final String message;

  const ProductDeleteSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class ProductDeleteError extends ProductDeleteState {
  final String message;

  const ProductDeleteError(this.message);

  @override
  List<Object?> get props => [message];
}
