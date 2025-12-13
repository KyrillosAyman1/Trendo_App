import 'package:trendo_app/helper/api.dart';
import 'package:trendo_app/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required String id,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
     Map<String,dynamic> jsonData = await Api().put(
      url: "https://fakestoreapi.com/products/$id",
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
        
      },
    );
    return ProductModel.fromJson(jsonData);
  }
}
