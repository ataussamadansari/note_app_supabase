import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final AuthController controller = Get.put(AuthController());

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      controller.checkSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Notes App",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
