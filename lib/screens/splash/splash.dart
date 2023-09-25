import 'package:ecommerce_project/constants/colors.dart';
import 'package:ecommerce_project/constants/images.dart';
import 'package:ecommerce_project/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const OnboardingScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kTertiaryColor,
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(logo),
            ),
            SizedBox(height: height * 0.05),
            Text(
              "Kobicypher",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            )
          ],
        )),
      ),
    );
  }
}
