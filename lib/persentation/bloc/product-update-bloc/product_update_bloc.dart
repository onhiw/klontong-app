import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klontong_app/domain/usecases/update_product.dart';

part 'product_update_event.dart';
part 'product_update_state.dart';

class ProductUpdateBloc extends Bloc<ProductUpdateEvent, ProductUpdateState> {
  final UpdateProduct updateProduct;
  ProductUpdateBloc(this.updateProduct) : super(ProductUpdateInitial()) {
    on<PutProduct>(_putProduct);
  }

  Future<void> _putProduct(
      PutProduct event, Emitter<ProductUpdateState> emit) async {
    emit(ProductUpdateLoading());

    final data = await updateProduct.execute(
        event.id!,
        event.productId!,
        event.categoryId!,
        event.categoryName!,
        event.sku!,
        event.name!,
        event.description!,
        event.weight!,
        event.width!,
        event.length!,
        event.height!,
        event.image!,
        event.price!);

    data.fold((failure) {
      emit(ProductUpdateError(failure.message));
    }, (success) {
      emit(ProductUpdateSuccess(success));
    });
  }
}
