import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trendo_app/models/product_model.dart';

class DetailsProductScreen extends StatelessWidget {
  const DetailsProductScreen({super.key});
  static String id = 'details-product-screen';
  @override
  Widget build(BuildContext context) {
    var productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 210, 226, 247),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(FontAwesomeIcons.arrowLeft, color: Color(0xff0c396d)),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 210, 226, 247),
          title: Text(
            'Product Details',
            style: TextStyle(
              color: Color(0xff0c396d),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.network(
                  productModel.image,
                  height: 250,
                  width: double.infinity,
                ),
                SizedBox(height: 20),
                Text(
                  productModel.title,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0c396d),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Price: \$${productModel.price}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Text(
                  'Rating: \$${productModel.rating.rate} (${productModel.rating.count} reviews)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  productModel.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
      
                SizedBox(height: 30),
                Text(
                  'Category: ${productModel.category}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
