import 'package:dartz/dartz.dart';
import 'package:klontong_app/data/datasources/product_remote_data_source.dart';
import 'package:klontong_app/domain/entities/product.dart';
import 'package:klontong_app/domain/repositories/product_repository.dart';
import 'package:klontong_app/utils/exception.dart';
import 'package:klontong_app/utils/failure.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<Either<Failure, List<Product>>> getAllProduct() async {
    try {
      final result = await productRemoteDataSource.getAllProduct();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(
          'Oops, An error occurred while connecting to the server'));
    } on FormatException {
      return const Left(ServerFailure(
          'Oops, An error occurred while connecting to the server'));
    }
  }

  @override
  Future<Either<Failure, Product>> getDetailProduct(String id) async {
    try {
      final result = await productRemoteDataSource.getDetailProduct(id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(
          'Oops, An error occurred while connecting to the server'));
    } on FormatException {
      return const Left(ServerFailure(
          'Oops, An error occurred while connecting to the server'));
    }
  }

  @override
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
      int price) async {
    try {
      final result = await productRemoteDataSource.createProduct(
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

      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(
          "Oops, An error occurred while connecting to the server"));
    } on FormatException {
      return const Left(ServerFailure(
          'Oops, An error occurred while connecting to the server'));
    }
  }

  @override
  Future<Either<Failure, String>> deleteProduct(String id) async {
    try {
      final result = await productRemoteDataSource.deleteProduct(id);

      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(
          "Oops, An error occurred while connecting to the server"));
    } on FormatException {
      return const Left(ServerFailure(
          'Oops, An error occurred while connecting to the server'));
    }
  }

  @override
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
      int price) async {
    try {
      final result = await productRemoteDataSource.updateProduct(
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

      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(
          "Oops, An error occurred while connecting to the server"));
    } on FormatException {
      return const Left(ServerFailure(
          'Oops, An error occurred while connecting to the server'));
    }
  }
}
