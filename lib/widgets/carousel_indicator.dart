import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce_project/constants/colors.dart';
import 'package:ecommerce_project/widgets/banner.dart';
import 'package:flutter/material.dart';

class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator({
    super.key,
    required this.banners,
    required CarouselController carouselController,
    required this.currentCarousel,
  }) : _carouselController = carouselController;

  final List<BannerWidget> banners;
  final CarouselController _carouselController;
  final int currentCarousel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: banners.asMap().entries.map((e) {
        return GestureDetector(
          onTap: () => _carouselController.animateToPage(e.key),
          child: Container(
            width: 15.0,
            height: 15.0,
            margin: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 4.0,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor
                  .withOpacity(currentCarousel == e.key ? 0.9 : 0.3),
            ),
          ),
        );
      }).toList(),
    );
  }
}
