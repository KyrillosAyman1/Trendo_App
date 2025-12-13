

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendo_app/cubit/add_and_remove__cart_cubit/add_and_remove_cart_cubit.dart';
import 'package:trendo_app/helper/custom_show_snak_bar.dart';
import 'package:trendo_app/models/product_model.dart';
import 'package:trendo_app/screens/update_product_screen.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key, required this.productModel});
   final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
              title: Text(
                'Options',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: Text(
                'Do you want to update this product or delete this product from cart?',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(
                      context,
                      UpdateProductScreen.id,
                      arguments: productModel,
                    );
                  },
                  child: Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    var addAndRemoveCartCubit =
                        BlocProvider.of<AddAndRemoveCartCubit>(context);
                    addAndRemoveCartCubit.removeFromCart(
                      productModel: productModel,
                    );
                    customShowSnackBar(
                      context: context,
                      message: "Product removed from cart successfully",
                    );
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
  }
}