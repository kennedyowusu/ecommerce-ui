import 'package:ecommerce_project/constants/colors.dart';
import 'package:flutter/material.dart';

class AuthBottomWidget extends StatelessWidget {
  const AuthBottomWidget({
    super.key,
    required this.mainText,
    required this.actionText,
    required this.onPressed,
  });

  final String mainText, actionText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(mainText),
        SizedBox(
          width: 10,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            actionText,
            style: TextStyle(
              color: kPrimaryColor,
            ),
          ),
        )
      ],
    );
  }
}
