import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trendo_app/cubit/add_and_remove_favorite_cubit/add_and_remove_favorite_state.dart';
import 'package:trendo_app/models/product_model.dart';

class AddAndRemoveFavoriteCubit extends Cubit<AddAndRemoveFavoriteState> {
  AddAndRemoveFavoriteCubit() : super(AddAndRemoveFavoriteInitial());
  List<ProductModel> itemsInFavorite = [];
  addToFavorite({required ProductModel productModel}) {
    try {
      if (!itemsInFavorite.any((p) => p.id == productModel.id)) {
  itemsInFavorite.add(productModel);
  emit(AddAndRemoveFavoriteSuccess(productsList: itemsInFavorite));
}
    } catch (e) {
      emit(AddAndRemoveFavoriteFailed(error: e.toString()));
    }
  }

  removeFromFavorite({required ProductModel productModel}) {
    try {
      if (itemsInFavorite.any((p) => p.id == productModel.id)) {
        itemsInFavorite.remove(productModel);

        if (itemsInFavorite.isEmpty) {
          emit(AddAndRemoveFavoriteInitial());
        } else {
          emit(AddAndRemoveFavoriteSuccess(productsList: itemsInFavorite));
        }
      }
    } catch (e) {
      emit(AddAndRemoveFavoriteFailed(error: e.toString()));
    }
  }

bool isFavorite(ProductModel product) {
  return itemsInFavorite.any((p) => p.id == product.id);
}
}
