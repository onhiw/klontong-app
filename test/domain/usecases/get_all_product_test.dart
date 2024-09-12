import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klontong_app/domain/entities/product.dart';
import 'package:klontong_app/domain/usecases/get_all_product.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetAllProduct usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = GetAllProduct(mockProductRepository);
  });

  final tProducts = <Product>[];

  test('should get list of product from the repository', () async {
    // arrange
    when(mockProductRepository.getAllProduct())
        .thenAnswer((_) async => Right(tProducts));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tProducts));
  });
}