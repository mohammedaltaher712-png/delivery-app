import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Customsetingcard extends StatelessWidget {
  const Customsetingcard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle, this.onTap,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // النصوص (العنوان + الوصف إن وجد)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  if (subtitle.isNotEmpty) SizedBox(height: 4),
                  if (subtitle.isNotEmpty)
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                ],
              ),
            ),
            SizedBox(width: 12),
            // الأيقونة
            Icon(icon, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
