import 'package:flutter/material.dart';

Widget inputField({
  TextEditingController? controller,
  String hintText = "Enter Text",
  bool onbscureText = false,
  String? Function(String?)? validate,
  TextInputType? keyboardType,
  Widget? prefixIcon,
}) {
  return TextFormField(
    controller: controller,
    keyboardAppearance: Brightness.light,
    keyboardType: keyboardType,
    validator: validate,
    decoration: InputDecoration(
      labelText: hintText,
      labelStyle: TextStyle(
        color: Colors.grey,
        fontSize: 16.0,
      ),
      prefixIcon: prefixIcon,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
    ),
  );
}
