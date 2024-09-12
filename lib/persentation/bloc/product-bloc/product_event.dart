part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {}

class FetchAllProduct extends ProductEvent {
  FetchAllProduct();

  @override
  List<Object?> get props => [];
}
