import 'package:dartz/dartz.dart';
import 'package:klontong_app/domain/entities/product.dart';
import 'package:klontong_app/domain/repositories/product_repository.dart';
import 'package:klontong_app/utils/failure.dart';

class GetAllProduct {
  final ProductRepository productRepository;

  GetAllProduct(this.productRepository);

  Future<Either<Failure, List<Product>>> execute() {
    return productRepository.getAllProduct();
  }
}
