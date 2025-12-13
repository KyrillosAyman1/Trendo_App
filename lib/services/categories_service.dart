
import 'package:trendo_app/helper/api.dart';
import 'package:trendo_app/models/product_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategoriesProducts({
    required String categoryName,
  }) async {
    List<dynamic> jsonData = await Api().get(
      url: "https://fakestoreapi.com/products/category/$categoryName"
    );
    List<ProductModel> productsList = [];

    for (var product in jsonData) {
      productsList.add(ProductModel.fromJson(product));
    }
    return productsList;
  }
}
