import 'package:dartz/dartz.dart';
import 'package:klontong_app/domain/entities/product.dart';
import 'package:klontong_app/utils/failure.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProduct();
  Future<Either<Failure, Product>> getDetailProduct(String id);
  Future<Either<Failure, Product>> createProduct(
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
    int price,
  );
  Future<Either<Failure, String>> updateProduct(
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
    int price,
  );
  Future<Either<Failure, String>> deleteProduct(String id);
}
