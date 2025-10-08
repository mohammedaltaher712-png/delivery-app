import 'package:flutter/material.dart';

class CustomTextFromFeild extends StatelessWidget {
  const CustomTextFromFeild({
    super.key,
    required this.label,
    required this.hintText,
    this.IconData,
    this.controllerMy,
    required this.validator,
    required this.isNumber,
    this.obscureText,
    this.onTap,
  });
  final String label;
  final String hintText;
  final IconData;
  final TextEditingController? controllerMy;
  final String? Function(String?) validator;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 10),
      child: TextFormField(
        keyboardType:
            isNumber
                ? TextInputType.numberWithOptions(decimal: true)
                : TextInputType.text,
        obscureText: obscureText == true,
        validator: validator,
        controller: controllerMy,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Container(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          prefixIcon: InkWell(onTap: onTap, child: Icon(IconData)),
          hintText: hintText,
          hintStyle: const TextStyle(fontWeight: FontWeight.bold),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
