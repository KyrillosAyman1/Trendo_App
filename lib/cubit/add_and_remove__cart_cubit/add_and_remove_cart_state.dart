import 'package:trendo_app/models/product_model.dart';

sealed class AddAndRemoveCartState {}

final class AddAndRemoveCartInitial extends AddAndRemoveCartState {}

final class AddAndRemoveCartSuccess extends AddAndRemoveCartState {
  final List<ProductModel> productsList;
  AddAndRemoveCartSuccess({required this.productsList});
}

final class AddAndRemoveCartFailed extends AddAndRemoveCartState {
  final String error;
  AddAndRemoveCartFailed({required this.error});
}
