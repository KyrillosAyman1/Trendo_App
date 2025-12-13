
import 'package:trendo_app/screens/cart_items_screen.dart';
import 'package:trendo_app/screens/category_screen.dart';
import 'package:trendo_app/screens/details_product_screen.dart';
import 'package:trendo_app/screens/favorite_item_screen.dart';
import 'package:trendo_app/screens/home_screen.dart';
import 'package:trendo_app/screens/splash_screen.dart';
import 'package:trendo_app/screens/update_product_screen.dart';

class AppRoutes {
  static final routes = {
    HomeScreen.id: (context) => const HomeScreen(),
    UpdateProductScreen.id: (context) => const UpdateProductScreen(),
    CategoryScreen.id: (context) => const CategoryScreen(),
    CartItemsScreen.id: (context) => const CartItemsScreen(),
    FavoriteItemScreen.id: (context) => const FavoriteItemScreen(),
    SplashScreen.id: (context) => const SplashScreen(),
    DetailsProductScreen.id: (context) => const DetailsProductScreen(),
  };
}
