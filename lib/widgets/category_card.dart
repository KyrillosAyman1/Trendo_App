import 'package:flutter/material.dart';
import 'package:trendo_app/screens/category_screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CategoryScreen.id, arguments: category);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 8),
        elevation: 4,
        color: Color(0xff0c396d),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            category,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
