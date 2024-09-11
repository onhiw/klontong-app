import 'dart:convert';

import 'package:klontong_app/data/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:klontong_app/utils/constants.dart';
import 'package:klontong_app/utils/exception.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProduct();
  Future<ProductModel> getDetailProduct(String id);
  Future<ProductModel> createProduct(
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
      int price);
  Future<String> updateProduct(
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
      int price);
  Future<String> deleteProduct(String id);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getAllProduct() async {
    final response = await client.get(Uri.parse('$baseUrl/product'));

    if (response.statusCode == 200) {
      return (response.body as List)
          .map((x) => ProductModel.fromJson(json.decode(x)))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> getDetailProduct(String id) async {
    final response = await client.get(Uri.parse('$baseUrl/product/$id'));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> createProduct(
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
    final response = await client.post(Uri.parse('$baseUrl/product'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "id": productId,
          "categoryId": categoryId,
          "categoryName": categoryName,
          "sku": sku,
          "name": name,
          "description": description,
          "weight": weight,
          "width": width,
          "length": length,
          "height": height,
          "image": image,
          "price": price
        }));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> deleteProduct(String id) async {
    final response = await client.delete(Uri.parse('$baseUrl/product/$id'),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      return "Successfully deleted item";
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> updateProduct(
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
    final response = await client.put(Uri.parse('$baseUrl/product/$id'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "id": productId,
          "categoryId": categoryId,
          "categoryName": categoryName,
          "sku": sku,
          "name": name,
          "description": description,
          "weight": weight,
          "width": width,
          "length": length,
          "height": height,
          "image": image,
          "price": price
        }));

    if (response.statusCode == 200) {
      return "Successfully changed item";
    } else {
      throw ServerException();
    }
  }
}
