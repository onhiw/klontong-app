import 'package:dartz/dartz.dart';
import 'package:klontong_app/domain/repositories/product_repository.dart';
import 'package:klontong_app/utils/failure.dart';

class UpdateProduct {
  final ProductRepository productRepository;

  UpdateProduct(this.productRepository);

  Future<Either<Failure, String>> execute(
      String id,
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
    return productRepository.updateProduct(
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
        price);
  }
}
