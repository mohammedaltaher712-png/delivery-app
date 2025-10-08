import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

class Customtextfromfield extends StatelessWidget {
  const Customtextfromfield({
    super.key,
    required this.text,
    this.controller,
    required this.labe,
    this.validator,
    required this.icondata,
    this.Iconspassword,
    this.onTap,
    this.obscureText,
    required this.isNumber,
  });
  final String text;
  final String labe;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Icon icondata;
  final IconData? Iconspassword;
  final void Function()? onTap;
  final bool? obscureText;
  final bool isNumber;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:
          isNumber
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
      obscureText: obscureText == true,
      validator: validator,
      controller: controller,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        prefixIcon: icondata,
        labelText: labe,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Appcolors.orange,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: text,
        suffixIcon: InkWell(onTap: onTap, child: Icon(Iconspassword)),

        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Appcolors.orange, width: 1.5),
        ),
      ),
    );
  }
}
