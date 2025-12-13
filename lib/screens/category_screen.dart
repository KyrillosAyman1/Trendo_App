import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:trendo_app/models/product_model.dart';
import 'package:trendo_app/services/categories_service.dart';
import 'package:trendo_app/widgets/custom_grid_view.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static String id = 'category-screen';
  @override
  Widget build(BuildContext context) {
    final String categoryName =
        ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(FontAwesomeIcons.arrowLeft, color: Color(0xff0c396d)),
          ),
          centerTitle: true,
          title: Text(
            categoryName,
            style: TextStyle(
              color: Color(0xff0c396d),
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        body: FutureBuilder(
          future: CategoriesService().getCategoriesProducts(
            categoryName: categoryName,
          ),
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              List<ProductModel> productsList = asyncSnapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomGridView(productsList: productsList),
              );
            } else if (asyncSnapshot.hasError) {
              return Center(child: Text('Error: ${asyncSnapshot.error}'));
            } else {
              return Center(
                child: Lottie.asset(
                  "assets/images/loading.json",
                  height: 200,
                  width: 200,
      
                  //fit: BoxFit.cover,
                  repeat: true,
                  alignment: Alignment.centerRight,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
