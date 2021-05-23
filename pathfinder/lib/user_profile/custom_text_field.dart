import 'package:flutter/material.dart';
import 'package:pathfinder/constants/color_helper.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType textInputType;

  CustomTextField(
      {this.textInputType, this.controller, this.hintText, this.obscureText});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 65,
      color: signUpTextColor,
      child: TextField(
        obscureText: obscureText,
        keyboardType: textInputType,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
