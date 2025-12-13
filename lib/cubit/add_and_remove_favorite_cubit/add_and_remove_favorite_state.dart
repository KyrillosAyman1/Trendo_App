import 'package:trendo_app/models/product_model.dart';

sealed class AddAndRemoveFavoriteState {}

final class AddAndRemoveFavoriteInitial extends AddAndRemoveFavoriteState {}

final class AddAndRemoveFavoriteSuccess extends AddAndRemoveFavoriteState {
  final List<ProductModel> productsList;
  AddAndRemoveFavoriteSuccess({required this.productsList});
}

final class AddAndRemoveFavoriteFailed extends AddAndRemoveFavoriteState {
  final String error;
  AddAndRemoveFavoriteFailed({required this.error});
}
