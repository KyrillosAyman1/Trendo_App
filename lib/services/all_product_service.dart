
import 'package:trendo_app/helper/api.dart';
import 'package:trendo_app/models/product_model.dart';

class AllProductService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> jsonData = await Api().get(
      url: "https://fakestoreapi.com/products",
    );
    List<ProductModel> productsList = [];

    for (var product in jsonData) {
      productsList.add(ProductModel.fromJson(product));
    }
    return productsList;
  }
}
