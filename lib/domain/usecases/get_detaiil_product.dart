import 'package:dartz/dartz.dart';
import 'package:klontong_app/domain/entities/product.dart';
import 'package:klontong_app/domain/repositories/product_repository.dart';
import 'package:klontong_app/utils/failure.dart';

class GetDetaiilProduct {
  final ProductRepository productRepository;

  GetDetaiilProduct(this.productRepository);

  Future<Either<Failure, Product>> execute(String id) {
    return productRepository.getDetailProduct(id);
  }
}
