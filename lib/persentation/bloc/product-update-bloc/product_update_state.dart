part of 'product_update_bloc.dart';

abstract class ProductUpdateState extends Equatable {
  const ProductUpdateState();
}

class ProductUpdateInitial extends ProductUpdateState {
  @override
  List<Object?> get props => [];
}

class ProductUpdateLoading extends ProductUpdateState {
  @override
  List<Object?> get props => [];
}

class ProductUpdateSuccess extends ProductUpdateState {
  final String message;

  const ProductUpdateSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class ProductUpdateError extends ProductUpdateState {
  final String message;

  const ProductUpdateError(this.message);

  @override
  List<Object?> get props => [message];
}
