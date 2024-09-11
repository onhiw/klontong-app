import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id;
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

  const Product({
    this.id,
    this.productId,
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
    this.price,
  });

  @override
  List<Object?> get props => [
        id,
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
        price,
      ];
}
