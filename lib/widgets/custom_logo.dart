import 'package:ecommerce_project/constants/images.dart';
import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  final double size = 70;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage(logo),
    );
  }
}
