import 'package:flutter_test/flutter_test.dart';
import 'package:klontong_app/data/models/product_model.dart';
import 'package:klontong_app/domain/entities/product.dart';

void main() {
  const productModel = ProductModel(
      id: "1",
      productId: 1,
      categoryId: 1,
      categoryName: "Baju Anak",
      sku: "sku-anak",
      name: "Baju Anak Bagus",
      description: "Baju Anak Bagus",
      weight: 1,
      width: 1,
      length: 10,
      height: 1,
      image: "image.png",
      price: 10000);

  const product = Product(
      id: "1",
      productId: 1,
      categoryId: 1,
      categoryName: "Baju Anak",
      sku: "sku-anak",
      name: "Baju Anak Bagus",
      description: "Baju Anak Bagus",
      weight: 1,
      width: 1,
      length: 10,
      height: 1,
      image: "image.png",
      price: 10000);

  test('should be a subclass of Product entity', () async {
    final result = productModel.toEntity();
    expect(result, product);
  });
}
