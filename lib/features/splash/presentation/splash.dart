import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/images.dart';

class SplashPage extends StatelessWidget {

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Center(child: Image.asset(Images.splashLogo,scale: 2,)),
    );
  }
}
