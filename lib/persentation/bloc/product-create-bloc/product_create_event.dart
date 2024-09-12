part of 'product_create_bloc.dart';

abstract class ProductCreateEvent extends Equatable {
  const ProductCreateEvent();
}

class PostProduct extends ProductCreateEvent {
  final int? productId;
  final int? categoryId;
  final String? categoryName;
  final String? sku;
  final String? name;
  final String? description;
  final int? weight;
  final int? width;
  final int? length;
  final int? height;
  final String? image;
  final int? price;

  const PostProduct(
      {this.productId,
      this.categoryId,
      this.categoryName,
      this.sku,
      this.name,
      this.description,
      this.weight,
      this.width,
      this.length,
      this.height,
      this.image,
      this.price});

  @override
  List<Object?> get props => [
        productId,
        categoryId,
        categoryName,
        sku,
        name,
        description,
        weight,
        width,
        length,
        height,
        image,
        price
      ];
}
