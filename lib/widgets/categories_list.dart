import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trendo_app/services/all_categories_service.dart';
import 'package:trendo_app/widgets/category_card.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,

      child: FutureBuilder(
        future: AllCategoriesService().getAllCategories(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            List<dynamic> categories = asyncSnapshot.data!;
            return ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryCard(category: categories[index]);
              },
            );
          } else if (asyncSnapshot.hasError) {
            return Center(child: Text('Error: ${asyncSnapshot.error}'));
          } else {
            return Center(
              child: Lottie.asset(
                "assets/images/Loading animation.json",
                height: 150,
                width: 100,

                //fit: BoxFit.cover,
                repeat: true,
                alignment: Alignment.centerRight,
              ),
            );
          }
        },
      ),
    );
  }
}
