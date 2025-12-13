
import 'package:trendo_app/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {

    List<dynamic> jsonData = await Api().get(
      url: "https://fakestoreapi.com/products/categories",
    );
    
    return jsonData;
  }
}
