import 'package:ecommerce_project/constants/colors.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.activeIndex});

  final bool activeIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: activeIndex ? 10 : 5,
        width: activeIndex ? 10 : 5,
        decoration: BoxDecoration(
          color: activeIndex ? kPrimaryColor : Colors.grey,
          shape: BoxShape.circle,
        ));
  }
}
