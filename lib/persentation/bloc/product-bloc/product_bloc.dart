import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klontong_app/domain/entities/product.dart';
import 'package:klontong_app/domain/usecases/get_all_product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProduct getAllProduct;
  ProductBloc(this.getAllProduct) : super(ProductInitial()) {
    on<FetchAllProduct>(_fetchAllProduct);
  }

  Future<void> _fetchAllProduct(
      FetchAllProduct event, Emitter<ProductState> emit) async {
    emit(ProductLoading());

    final data = await getAllProduct.execute();

    data.fold((failure) {
      emit(ProductError(failure.message));
    }, (success) {
      emit(ProductLoaded(success));
    });
  }
}
