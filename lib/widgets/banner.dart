import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final String text, image, btnText;
  final TextDirection textDirection;
  final double imgWidth;
  final Color titleColor, backgroundColor, buttonColor, btnBgColor;

  const BannerWidget({
    super.key,
    required this.text,
    required this.image,
    required this.btnText,
    required this.textDirection,
    required this.imgWidth,
    required this.titleColor,
    required this.backgroundColor,
    required this.buttonColor,
    required this.btnBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, right: 16.0, left: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            textDirection: textDirection,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 18.0,
                ),
                child: Column(
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 18,
                        color: titleColor,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: btnBgColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        ),
                      ),
                      child: Text(
                        btnText,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: buttonColor,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Image.asset(
                image,
                alignment: Alignment.bottomRight,
                fit: BoxFit.cover,
                width: imgWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
