import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trendo_app/models/product_model.dart';
import 'package:trendo_app/services/all_product_service.dart';
import 'package:trendo_app/widgets/product_card.dart';

class CustomSliverGrid extends StatefulWidget {
  const CustomSliverGrid({super.key, required this.searchControl});
  final TextEditingController searchControl;
  @override
  State<CustomSliverGrid> createState() => _CustomSliverGridState();
}

class _CustomSliverGridState extends State<CustomSliverGrid> {
  List<ProductModel> _filterProducts(List<ProductModel> products) {
    final text = widget.searchControl.text.toLowerCase();
    if (text.isEmpty) return products;

    return products.where((c) => c.title.toLowerCase().contains(text)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AllProductService().getAllProducts(),
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          final List<ProductModel> productsList = _filterProducts(
            asyncSnapshot.data ?? [],
          );
          if (productsList.isEmpty) {
            return SliverFillRemaining(
              child: const Center(
                child: Text(
                  "No products found",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0c396d),
                  ),
                ),
              ),
            );
          }

          return SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ProductCard(productModel: productsList[index],);
              }, childCount: productsList.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.75,
                mainAxisExtent: MediaQuery.of(context).size.height * 0.34,
              ),
            ),
          );
        } else if (asyncSnapshot.hasError) {
          return SliverToBoxAdapter(
            child: Center(child: Text('Error: ${asyncSnapshot.error}')),
          );
        } else {
          return SliverFillRemaining(
            child: Center(
              child: Lottie.asset(
                "assets/images/loading.json",
                height: 300,
                width: 300,

                //fit: BoxFit.cover,
                repeat: true,
                alignment: Alignment.centerRight,
              ),
            ),
          );
        }
      },
    );
  }
}
