import 'package:ecommerce_project/constants/colors.dart';
import 'package:flutter/material.dart';

class RatingContainer extends StatelessWidget {
  const RatingContainer({
    super.key,
    required this.productRating,
    required this.totalReview,
  });

  final double productRating;
  final int totalReview;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.star_rounded,
              color: Color(0xFFF5B539),
              size: 24,
            ),
            Text(
              "$productRating Ratings",
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
        Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: kOnGreyColor,
          ),
        ),
        Text(
          "$totalReview+ Review",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
