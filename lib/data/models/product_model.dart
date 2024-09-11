import 'package:equatable/equatable.dart';
import 'package:klontong_app/domain/entities/product.dart';

class ProductModel extends Equatable {
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

  Product toEntity() {
    return Product(
        id: id,
        productId: productId,
        categoryId: categoryId,
        categoryName: categoryName,
        sku: sku,
        name: name,
        description: description,
        weight: weight,
        width: width,
        length: length,
        height: height,
        image: image,
        price: price);
  }

  const ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        productId: json["id"],
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        sku: json["sku"],
        name: json["name"],
        description: json["description"],
        weight: json["weight"],
        width: json["width"],
        length: json["length"],
        height: json["height"],
        image: json["image"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "id": productId,
        "CategoryId": categoryId,
        "categoryName": categoryName,
        "sku": sku,
        "name": name,
        "description": description,
        "weight": weight,
        "width": width,
        "length": length,
        "height": height,
        "image": image,
        "price": price,
      };

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
