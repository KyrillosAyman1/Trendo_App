import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendo_app/cubit/add_and_remove__cart_cubit/add_and_remove_cart_cubit.dart';
import 'package:trendo_app/cubit/add_and_remove_favorite_cubit/add_and_remove_favorite_cubit.dart';
import 'package:trendo_app/cubit/add_and_remove_favorite_cubit/add_and_remove_favorite_state.dart';
import 'package:trendo_app/widgets/custom_alert_dialog.dart';
import 'package:trendo_app/models/product_model.dart';
import 'package:trendo_app/screens/details_product_screen.dart';
import 'package:trendo_app/helper/custom_show_snak_bar.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return CustomAlertDialog(productModel: widget.productModel);
          },
        );
      },
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailsProductScreen.id,
          arguments: widget.productModel,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha((255 * .1).round()),
              spreadRadius: 0,
              blurRadius: 40,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),

        child: Card(
          elevation: 6,
          color: Color(0xfff1f1f1),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 45,
                      width: 35,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff288be6), Color(0xff0c396d)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${widget.productModel.rating.rate}★",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    BlocBuilder<
                      AddAndRemoveFavoriteCubit,
                      AddAndRemoveFavoriteState
                    >(
                      builder: (context, state) {
                        final favoriteCubit =
                            BlocProvider.of<AddAndRemoveFavoriteCubit>(context);

                        bool isFavorite = favoriteCubit.isFavorite(
                          widget.productModel,
                        );
                        return IconButton(
                          onPressed: () {
                            final favoriteCubit = context
                                .read<AddAndRemoveFavoriteCubit>();
                            if (favoriteCubit.isFavorite(widget.productModel)) {
                              favoriteCubit.removeFromFavorite(
                                productModel: widget.productModel,
                              );
                              customShowSnackBar(
                                context: context,
                                message: "Removed from favorite",
                              );
                            } else {
                              favoriteCubit.addToFavorite(
                                productModel: widget.productModel,
                              );
                              customShowSnackBar(
                                context: context,
                                message: "Added to favorite",
                              );
                            }
                          },
                          icon: Icon(
                            Icons.favorite,
                            size: 26,
                            color: isFavorite ? Colors.red : Colors.grey,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Center(
                  child: Image.network(
                    widget.productModel.image,
                    height: 100,
                    width: 100,
                  ),
                ),
                Text(
                  widget.productModel.title,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.productModel.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r"$"
                      "${widget.productModel.price}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff288be6),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        var addCartCubit =
                            BlocProvider.of<AddAndRemoveCartCubit>(context);
                        addCartCubit.addToCart(
                          productModel: widget.productModel,
                        );
                        customShowSnackBar(
                          context: context,
                          message: "Product added to cart successfully",
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xff0c396d),
                        minimumSize: Size(60, 18),
                      ),
                      child: Text(
                        "add",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
