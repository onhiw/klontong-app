part of 'product_delete_bloc.dart';

abstract class ProductDeleteEvent extends Equatable {
  const ProductDeleteEvent();
}

class DeleteByIdProduct extends ProductDeleteEvent {
  final String? id;

  const DeleteByIdProduct({this.id});

  @override
  List<Object?> get props => [id];
}
