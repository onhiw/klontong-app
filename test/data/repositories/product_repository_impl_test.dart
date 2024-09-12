import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klontong_app/data/models/product_model.dart';
import 'package:klontong_app/data/repositories/product_repository_impl.dart';
import 'package:klontong_app/domain/entities/product.dart';
import 'package:klontong_app/utils/exception.dart';
import 'package:klontong_app/utils/failure.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late ProductRepositoryImpl repository;
  late MockProductRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockProductRemoteDataSource();
    repository =
        ProductRepositoryImpl(productRemoteDataSource: mockRemoteDataSource);
  });

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

  final tProductModelList = <ProductModel>[productModel];
  final tProductList = <Product>[product];

  group('Products', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getAllProduct())
          .thenAnswer((_) async => tProductModelList);
      // act
      final result = await repository.getAllProduct();
      // assert
      verify(mockRemoteDataSource.getAllProduct());

      final resultList = result.getOrElse(() => []);
      expect(resultList, tProductList);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getAllProduct()).thenThrow(ServerException());
      // act
      final result = await repository.getAllProduct();
      // assert
      verify(mockRemoteDataSource.getAllProduct());
      expect(result, equals(const Left(ServerFailure(''))));
    });
  });
}
