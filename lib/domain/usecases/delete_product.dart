import 'package:dartz/dartz.dart';
import 'package:klontong_app/domain/repositories/product_repository.dart';
import 'package:klontong_app/utils/failure.dart';

class DeleteProduct {
  final ProductRepository productRepository;

  DeleteProduct(this.productRepository);

  Future<Either<Failure, String>> execute(String id) {
    return productRepository.deleteProduct(id);
  }
}
