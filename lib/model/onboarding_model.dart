import 'package:ecommerce_project/constants/images.dart';

class OnboardingModel {
  final String title, description, image;

  OnboardingModel(
      {required this.title, required this.description, required this.image});
}

final List<OnboardingModel> onboardingContent = [
  OnboardingModel(
    title: "Welcome to ShopMart",
    description:
        "ShopMart is an e-commerce platform \nfocused on convenience and quality",
    image: onboardingImage1,
  ),
  OnboardingModel(
    title: "Secure Shopping",
    description:
        "Your transactions are securely processed \nfor worry -free shopping",
    image: onboardingImage2,
  ),
  OnboardingModel(
    title: "Fast Delivery",
    description: "We deliver your orders in \nless than 48 hours",
    image: onboardingImage3,
  ),
];
