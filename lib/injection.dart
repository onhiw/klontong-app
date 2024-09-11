import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:klontong_app/data/datasources/product_remote_data_source.dart';
import 'package:klontong_app/data/repositories/product_repository_impl.dart';
import 'package:klontong_app/domain/repositories/product_repository.dart';
import 'package:klontong_app/domain/usecases/create_product.dart';
import 'package:klontong_app/domain/usecases/delete_product.dart';
import 'package:klontong_app/domain/usecases/get_all_product.dart';
import 'package:klontong_app/domain/usecases/get_detaiil_product.dart';
import 'package:klontong_app/domain/usecases/update_product.dart';

final locator = GetIt.instance;

void init() {
  // use case
  locator.registerLazySingleton(() => GetAllProduct(locator()));
  locator.registerLazySingleton(() => GetDetaiilProduct(locator()));
  locator.registerLazySingleton(() => CreateProduct(locator()));
  locator.registerLazySingleton(() => UpdateProduct(locator()));
  locator.registerLazySingleton(() => DeleteProduct(locator()));

  // repository
  locator.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(productRemoteDataSource: locator()));

  // data sources
  locator.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(client: locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
}
