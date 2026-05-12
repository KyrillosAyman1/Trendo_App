import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendo_app/cubit/add_and_remove__cart_cubit/add_and_remove_cart_cubit.dart';
import 'package:trendo_app/cubit/add_and_remove_favorite_cubit/add_and_remove_favorite_cubit.dart';
import 'package:trendo_app/routes/routes.dart';

import 'package:trendo_app/screens/splash_screen.dart';

void main() {
  runApp(const TrendoApp());
}

class TrendoApp extends StatelessWidget {
  const TrendoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddAndRemoveCartCubit()),
        BlocProvider(create: (context) => AddAndRemoveFavoriteCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trendo App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff0c396d)),
        ),
        routes: AppRoutes.routes, 
        initialRoute: SplashScreen.id,
      ),
    );
  }
}
