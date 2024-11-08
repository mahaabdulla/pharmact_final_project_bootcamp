import 'package:flutter/material.dart';
import 'package:pharmcy/core/views/widgets/button.dart';

import '../../../../helper/storage_helper.dart';

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
      StorageHelper sHelper = StorageHelper.instance;
      sHelper.readKey("token") == null
          ? Navigator.pushNamedAndRemoveUntil(
              context, "/regester", (route) => false)
          : Navigator.pushNamedAndRemoveUntil(
              context, "/home", (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/5_20241014_002615_٠٠٠٤.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
         /* const Positioned(
            top: 400,
            left: 100,
            child: Text(
              ' الأدوية الفائضة',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
