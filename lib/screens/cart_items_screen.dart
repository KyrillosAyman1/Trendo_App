import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trendo_app/cubit/add_and_remove__cart_cubit/add_and_remove_cart_cubit.dart';
import 'package:trendo_app/cubit/add_and_remove__cart_cubit/add_and_remove_cart_state.dart';
import 'package:trendo_app/widgets/custom_grid_view.dart';

class CartItemsScreen extends StatelessWidget {
  const CartItemsScreen({super.key});
  static String id = 'cart-items-screen';
  @override
  Widget build(BuildContext context) {
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
            "Cart Items",
            style: TextStyle(
              color: Color(0xff0c396d),
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        body: BlocBuilder<AddAndRemoveCartCubit, AddAndRemoveCartState>(
          builder: (context, state) {
            if (state is AddAndRemoveCartSuccess) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomGridView(productsList: state.productsList),
              );
            } else if (state is AddAndRemoveCartFailed) {
              return Center(child: Text('Error: ${state.error}'));
            }
            return Center(
              child: Text(
                "No products found",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0c396d),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
