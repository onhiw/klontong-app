part of 'product_detail_bloc.dart';

sealed class ProductDetailEvent extends Equatable {}

class FetchProductDetail extends ProductDetailEvent {
  final String? id;

  FetchProductDetail({this.id});

  @override
  List<Object?> get props => [id];
}
