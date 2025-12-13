import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendo_app/cubit/add_and_remove__cart_cubit/add_and_remove_cart_state.dart';
import 'package:trendo_app/models/product_model.dart';

class AddAndRemoveCartCubit extends Cubit<AddAndRemoveCartState> {
  AddAndRemoveCartCubit() : super(AddAndRemoveCartInitial());
  List<ProductModel> itemsInCart = [];
  addToCart({required ProductModel productModel}) {
    try {
     if (!itemsInCart.any((p) => p.id == productModel.id)) {
  itemsInCart.add(productModel);
  emit(AddAndRemoveCartSuccess(productsList: itemsInCart));
}
    } catch (e) {
      emit(AddAndRemoveCartFailed(error: e.toString()));
    }
  }

  removeFromCart({required ProductModel productModel}) {
    try {
      if (itemsInCart.any((p) => p.id == productModel.id)) {
        itemsInCart.remove(productModel);
        if (itemsInCart.isEmpty) {
          emit(AddAndRemoveCartInitial());
        } else {
          emit(AddAndRemoveCartSuccess(productsList: itemsInCart));
        }
      }
    } catch (e) {
      emit(AddAndRemoveCartFailed(error: e.toString()));
    }
  }
}
