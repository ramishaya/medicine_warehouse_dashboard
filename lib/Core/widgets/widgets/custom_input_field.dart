

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';



class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    required this.size,
    required this.mobilenumberController,
    required this.hintText,
    required this.labelText,
    required this.fieldColor,
    required this.icon,
    required this.isObscure,
    this.keyboardType, // Optional parameter for keyboard type
    this.inputFormatters, // Optional parameter for input formatters
  });

  final Size size;
  final TextEditingController mobilenumberController;
  final String hintText;
  final String labelText;
  final Color fieldColor;
  final IconData icon;
  final bool isObscure;
  final TextInputType? keyboardType; // Nullable TextInputType
  final List<TextInputFormatter>?
      inputFormatters; // Nullable list of TextInputFormatter

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: size.width * sidesmargin,
        right: size.width * sidesmargin,
        bottom: size.width * sidesmargin,
      ),
      child: TextFormField(
        controller: mobilenumberController,
        cursorColor: fieldColor,
        obscureText: isObscure,
        keyboardType: keyboardType, // Use the keyboardType passed to the class
        inputFormatters:
            inputFormatters, // Use the inputFormatters passed to the class
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 9, horizontal: 30),
          suffixIcon: Icon(icon, color: fieldColor),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(
              labelText,
              style: TextStyle(color: fieldColor),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}