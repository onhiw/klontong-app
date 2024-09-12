import 'package:http/http.dart' as http;
import 'package:klontong_app/data/datasources/product_remote_data_source.dart';
import 'package:klontong_app/domain/repositories/product_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  ProductRepository,
  ProductRemoteDataSource,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
