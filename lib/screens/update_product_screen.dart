// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:trendo_app/models/product_model.dart';
import 'package:trendo_app/services/update_product.dart';
import 'package:trendo_app/widgets/custom_button.dart';
import 'package:trendo_app/helper/custom_show_snak_bar.dart';
import 'package:trendo_app/widgets/custom_text_field.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});
  static String id = 'update-product-screen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productImageUrlController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ProductModel? productModel;
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    if (productModel == null) {
      productModel = ModalRoute.of(context)!.settings.arguments as ProductModel;
      productNameController.text = productModel!.title;
      productPriceController.text = productModel!.price.toString();
      productDescriptionController.text = productModel!.description;
      productImageUrlController.text = productModel!.image;
      super.didChangeDependencies();
    }
  }

  @override
  void dispose() {
    productNameController.dispose();
    productPriceController.dispose();
    productDescriptionController.dispose();
    productImageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: SafeArea(
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
              'Update Product',
              style: TextStyle(
                color: Color(0xff0c396d),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CustomTextField(
                  
                      hintText: 'Enter product name',
                      labelText: 'Product Name',
                      controller: productNameController,
                      onChanged: (value) {
                        productNameController.text = value;
                      },
                    ),
                    SizedBox(height: 15),
                    CustomTextField(
                      hintText: 'Enter product price',
                      labelText: 'Product Price',
                      controller: productPriceController,
                      onChanged: (value) {
                        productPriceController.text = value;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 15),
                    CustomTextField(
                      hintText: 'Enter product description',
                      labelText: 'Product Description',
                      controller: productDescriptionController,
                      onChanged: (value) {
                        productDescriptionController.text = value;
                      },
                      maxLines: 6,
                    ),
                    SizedBox(height: 15),
                        
                    CustomTextField(
                      hintText: 'Enter product image URL',
                      labelText: 'Product Image URL',
                      controller: productImageUrlController,
                      onChanged: (value) {
                        productImageUrlController.text = value;
                      },
                      maxLines: 3,
                    ),
                    SizedBox(height: 50),
                    CustomButton(
                      title: 'Update Product',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            await updateProduct();
                            customShowSnackBar(
                              // ignore: use_build_context_synchronously
                              context: context,
                              message: 'Product updated successfully',
                            );
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          } catch (e) {
                            customShowSnackBar(
                              // ignore: use_build_context_synchronously
                              context: context,
                              message: 'Failed to update product: $e',
                            );
                          } finally {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                          
                      
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct() async {
    await UpdateProductService().updateProduct(
      id: productModel!.id.toString(),
      title: productNameController.text,
      price: productPriceController.text,
      description: productDescriptionController.text,
      image: productImageUrlController.text,
      category: productModel!.category,
    );
  }
}
