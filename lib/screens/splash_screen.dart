import 'package:flutter/material.dart';
import 'package:trendo_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = 'splash-screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    future();
  }

  Future<void> future() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(
      // ignore: use_build_context_synchronously
      context,
      HomeScreen.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 94, 138, 196),
      body: Center(
        child: Image.asset(
          'assets/images/t1.png',
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.6,
        ),
      ),
    );
  }
}
