import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trendo_app/cubit/add_and_remove_favorite_cubit/add_and_remove_favorite_cubit.dart';
import 'package:trendo_app/cubit/add_and_remove_favorite_cubit/add_and_remove_favorite_state.dart';
import 'package:trendo_app/widgets/custom_grid_view.dart';

class FavoriteItemScreen extends StatelessWidget {
  const FavoriteItemScreen({super.key});
  static String id = 'favorite-items-screen';
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
            "Favorite Items",
            style: TextStyle(
              color: Color(0xff0c396d),
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        body: BlocBuilder<AddAndRemoveFavoriteCubit, AddAndRemoveFavoriteState>(
          builder: (context, state) {
            if (state is AddAndRemoveFavoriteSuccess) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomGridView(productsList: state.productsList),
              );
            } else if (state is AddAndRemoveFavoriteFailed) {
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
