import 'package:flutter/material.dart';

class Customsearch extends StatelessWidget {
  const Customsearch({super.key, required this.title, this.controller, this.onChanged});
  final String title;
final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // لون الظل
            spreadRadius: 1, // مدى الانتشار
            blurRadius: 10, // درجة التمويه
            offset: const Offset(0, 0), // مكان الظل (x, y)
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          hintText: title,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          filled: true,
          fillColor: Colors.white, // خلفية بيضاء
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          prefixIcon: Container(
            margin: const EdgeInsets.all(6), // مسافة بين الأيقونة والحواف
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent, // اللون البرتقالي للأيقونة
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.search,
              color: Colors.white, // لون الأيقونة أبيض
              size: 22,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30), // حواف دائرية أكثر
          ),
        ),
      ),
    );
  }
}
