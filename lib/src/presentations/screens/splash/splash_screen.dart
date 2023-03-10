import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_super_app/src/presentations/screens/home/home_controller.dart';
import 'package:my_super_app/src/presentations/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          GetPageRoute(page: () => const HomeScreen(), binding: HomeBinding()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(
      child: Text("Splash"),
    ));
  }

  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }
}
