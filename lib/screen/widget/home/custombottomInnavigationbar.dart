import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Custombottominnavigationbar extends StatelessWidget {
  const Custombottominnavigationbar({
    super.key,
    this.IconData,
    required this.title,
    this.onPressed,
  });
  final IconData;
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(IconData),
            Text(title, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
