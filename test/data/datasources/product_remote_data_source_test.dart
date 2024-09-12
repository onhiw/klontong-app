import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:klontong_app/data/datasources/product_remote_data_source.dart';
import 'package:klontong_app/data/models/product_model.dart';
import 'package:klontong_app/utils/exception.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  const baseUrl = 'https://crudcrud.com/api/274ee7283a934e25a80aae4052e84014';

  late ProductRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = ProductRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get Products', () {
    final tProductList = (readJson('dummy_data/product.json') as List)
        .map((x) => ProductModel.fromJson(json.decode(x)))
        .toList();

    test('should return list of Product Model when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/product'))).thenAnswer(
          (_) async => http.Response(readJson('dummy_data/product.json'), 200));
      // act
      final result = await dataSource.getAllProduct();
      // assert
      expect(result, equals(tProductList));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/product')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getAllProduct();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('get Product Detail', () {
    final tProductDetail = ProductModel.fromJson(
        json.decode(readJson('dummy_data/product_detail.json')));

    test('should return detail of Product Model when the response code is 200',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/product/1'))).thenAnswer(
          (_) async =>
              http.Response(readJson('dummy_data/product_detail.json'), 200));
      // act
      final result = await dataSource.getDetailProduct("1");
      // assert
      expect(result, equals(tProductDetail));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('$baseUrl/product/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getDetailProduct("1");
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
