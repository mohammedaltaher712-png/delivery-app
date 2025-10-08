import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/data/model/couponmodle.dart';

class Customcouponcontainer extends StatelessWidget {
  final List<CouponModle> coupons;
  final CouponModle? selectedCoupon;
  final void Function(CouponModle?) onSelectCoupon;
  final VoidCallback onActivateCoupon;

  final String title;
  final String dropdownLabel;
  final String hintWhenAvailable;
  final String hintWhenEmpty;
  final String activateButtonText;

  /// ✅ العنصر الجديد: لتخصيص شكل كل عنصر
  final Widget Function(CouponModle)? itemBuilder;

  const Customcouponcontainer({
    super.key,
    required this.coupons,
    required this.selectedCoupon,
    required this.onSelectCoupon,
    required this.onActivateCoupon,
    this.title = "الخصم - الكوبون",
    this.dropdownLabel = "اختر كوبون الخصم",
    this.hintWhenAvailable = "اختر الخصم",
    this.hintWhenEmpty = "لا يوجد كوبونات متاحة",
    this.activateButtonText = "تفعيل الخصم",
    this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Appcolors.orange, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Appcolors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: FaIcon(
                FontAwesomeIcons.gift,
                color: Appcolors.Lsitca,
                size: 24,
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Appcolors.black,
              ),
            ),
          ),
          Divider(color: Appcolors.orange, thickness: 1, height: 30),
          SizedBox(height: 10),

          /// Dropdown
          DropdownButtonFormField<CouponModle>(
            decoration: InputDecoration(
              labelText: dropdownLabel,
              labelStyle: TextStyle(color: Appcolors.orange),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            isExpanded: true,
            value: selectedCoupon,
            hint: Text(
              coupons.isNotEmpty ? hintWhenAvailable : hintWhenEmpty,
              style: TextStyle(fontSize: 14),
            ),
            onChanged: onSelectCoupon,
            items:
                coupons.map((cat) {
                  return DropdownMenuItem<CouponModle>(
                    value: cat,
                    child:
                        itemBuilder != null
                            ? itemBuilder!(cat)
                            : Text(
                              cat.couponsName ?? '',
                              style: TextStyle(fontSize: 14),
                            ),
                  );
                }).toList(),
          ),

          SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Appcolors.orange,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
              ),
              icon: Icon(Icons.discount, color: Colors.white),
              label: Text(
                activateButtonText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              onPressed: onActivateCoupon,
            ),
          ),
        ],
      ),
    );
  }
}
