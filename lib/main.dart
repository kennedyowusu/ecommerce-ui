import 'package:ecommerce_project/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_project/screens/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
      theme: ProjectTheme.themeData,
      home: SplashScreen(),
    );
  }
}
