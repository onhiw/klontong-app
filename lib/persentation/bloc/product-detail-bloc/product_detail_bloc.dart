import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klontong_app/domain/entities/product.dart';
import 'package:klontong_app/domain/usecases/get_detaiil_product.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final GetDetaiilProduct getDetaiilProduct;
  ProductDetailBloc(this.getDetaiilProduct) : super(ProductDetailInitial()) {
    on<FetchProductDetail>(_fetchProductDetail);
  }

  Future<void> _fetchProductDetail(
      FetchProductDetail event, Emitter<ProductDetailState> emit) async {
    emit(ProductDetailLoading());

    final data = await getDetaiilProduct.execute(event.id!);

    data.fold((failure) {
      emit(ProductDetailError(failure.message));
    }, (success) {
      emit(ProductDetailLoaded(success));
    });
  }
}
