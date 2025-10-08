import 'package:flutter/material.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData icondata;
  final bool? active;
  const CustomButtonAppBar({
    super.key,
    required this.textbutton,
    required this.icondata,
    required this.onPressed,
    required this.active,
  });

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
            Icon(
              icondata,
              color: active == true ? Appcolors.orange : Appcolors.grey,
            ),
            Text(
              textbutton,
              style: TextStyle(
                fontSize: 12,
                color: active == true ? Appcolors.orange : Appcolors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
