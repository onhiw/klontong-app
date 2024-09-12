import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klontong_app/domain/usecases/delete_product.dart';

part 'product_delete_event.dart';
part 'product_delete_state.dart';

class ProductDeleteBloc extends Bloc<ProductDeleteEvent, ProductDeleteState> {
  final DeleteProduct deleteProduct;
  ProductDeleteBloc(this.deleteProduct) : super(ProductDeleteInitial()) {
    on<DeleteByIdProduct>(_deleteByIdProduct);
  }

  Future<void> _deleteByIdProduct(
      DeleteByIdProduct event, Emitter<ProductDeleteState> emit) async {
    emit(ProductDeleteLoading());

    final data = await deleteProduct.execute(event.id!);

    data.fold((failure) {
      emit(ProductDeleteError(failure.message));
    }, (success) {
      emit(ProductDeleteSuccess(success));
    });
  }
}
