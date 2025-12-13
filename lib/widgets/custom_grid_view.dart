import 'package:flutter/material.dart';
import 'package:trendo_app/models/product_model.dart';
import 'package:trendo_app/widgets/product_card.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    required this.productsList,
  });

  final List<ProductModel> productsList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productsList.length,
      itemBuilder: (context, index) {
        return ProductCard(productModel: productsList[index],);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.75,
        mainAxisExtent: MediaQuery.of(context).size.height * 0.34,
      ),
    );
  }
}