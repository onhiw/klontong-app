import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klontong_app/domain/entities/product.dart';
import 'package:klontong_app/domain/usecases/create_product.dart';

part 'product_create_event.dart';
part 'product_create_state.dart';

class ProductCreateBloc extends Bloc<ProductCreateEvent, ProductCreateState> {
  final CreateProduct createProduct;
  ProductCreateBloc(this.createProduct) : super(ProductCreateInitial()) {
    on<PostProduct>(_postProduct);
  }

  Future<void> _postProduct(
      PostProduct event, Emitter<ProductCreateState> emit) async {
    emit(ProductCreateLoading());

    final data = await createProduct.execute(
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
      emit(ProductCreateError(failure.message));
    }, (success) {
      emit(ProductCreateSuccess(success));
    });
  }
}
