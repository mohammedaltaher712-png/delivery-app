import 'package:flutter/material.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/data/model/Addressmodel.dart';

class Customaddresscontainer extends StatelessWidget {
  final AddressModel? selectedAddress;
  final void Function()? onChangeAddressPressed;
  final Future<AddressModel?> Function()?
  onSelectAddress; // لو تريد اختيار عنوان وارجاعه
  final double? distanceInKm;
  final double? deliveryPrice;

  final String titleText;
  final String changeButtonText;
  final String noAddressText;
  final String selectAddressButtonText;

  const Customaddresscontainer({
    super.key,
    required this.selectedAddress,
    required this.onChangeAddressPressed,
    this.onSelectAddress,
    this.distanceInKm,
    this.deliveryPrice,
    this.titleText = "عنوان التوصيل",
    this.changeButtonText = "تغيير",
    this.noAddressText = "لا يوجد عنوان محدد",
    this.selectAddressButtonText = "اختيار عنوان",
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
          // 🔶 عنوان + زر تغيير
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Appcolors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.location_on, color: Appcolors.Lsitca),
              ),

              SizedBox(width: 12),
              Text(
                titleText,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Appcolors.black,
                ),
              ),
              Spacer(),
              TextButton.icon(
                onPressed: onChangeAddressPressed,
                icon: Icon(Icons.edit_location_alt, color: Appcolors.orange),
                label: Text(
                  changeButtonText,
                  style: TextStyle(
                    color: Appcolors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Appcolors.orange.withOpacity(0.3),
            thickness: 1,
            height: 25,
          ),

          selectedAddress == null
              ? Column(
                children: [
                  SizedBox(height: 12),
                  Icon(Icons.error_outline, color: Colors.red, size: 40),
                  SizedBox(height: 8),
                  Text(
                    noAddressText,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () async {
                      if (onSelectAddress != null) {
                        final result = await onSelectAddress!();
                        // هنا يمكنك إرسال النتيجة لجهة التحكم أو الأعلى حسب التطبيق
                      }
                    },
                    icon: Icon(Icons.add_location_alt),
                    label: Text(selectAddressButtonText),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolors.orange,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                    ),
                  ),
                ],
              )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Appcolors.orange),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          selectedAddress!.addressusersName ?? "---",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Appcolors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_city, color: Colors.grey[700]),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          selectedAddress!.addressusersDescription ?? "---",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
        ],
      ),
    );
  }
}
