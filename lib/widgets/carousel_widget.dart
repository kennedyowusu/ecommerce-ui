import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/widgets/banner.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  final CarouselController carouselController;
  final Function(int) onPageChanged;
  final List<BannerWidget> bannerWidget;

  const CarouselWidget({
    super.key,
    required this.carouselController,
    required this.onPageChanged,
    required this.bannerWidget,
  });

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: widget.carouselController,
      options: CarouselOptions(
        viewportFraction: 1.0,
        aspectRatio: 21 / 9.75,
        autoPlay: true,
        onPageChanged: (int index, CarouselPageChangedReason reason) {
          widget.onPageChanged(index);
        },
      ),
      items: widget.bannerWidget,
    );
  }
}
