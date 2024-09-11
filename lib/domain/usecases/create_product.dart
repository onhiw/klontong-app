import 'package:dartz/dartz.dart';
import 'package:klontong_app/domain/entities/product.dart';
import 'package:klontong_app/domain/repositories/product_repository.dart';
import 'package:klontong_app/utils/failure.dart';

class CreateProduct {
  final ProductRepository productRepository;

  CreateProduct(this.productRepository);

  Future<Either<Failure, Product>> execute(
      int productId,
      int categoryId,
      String categoryName,
      String sku,
      String name,
      String description,
      int weight,
      int width,
      int length,
      int height,
      String image,
      int price) {
    return productRepository.createProduct(productId, categoryId, categoryName,
        sku, name, description, weight, width, length, height, image, price);
  }
}
