import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:order_delivery_application/core/constant/AppColors.dart';
import 'package:order_delivery_application/data/model/paymentmodle.dart';
import 'package:order_delivery_application/Linkapi.dart';

class CustomPaymentMethodContainer extends StatelessWidget {
  final List<PaymentModle> paymentOptions;
  final int? selectedPaymentId;
  final Function(int?) onPaymentSelected;
  final String title;
  const CustomPaymentMethodContainer({
    super.key,
    required this.paymentOptions,
    required this.selectedPaymentId,
    required this.onPaymentSelected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Appcolors.orange, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Appcolors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.credit_card, color: Appcolors.Lsitca),
              ),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Appcolors.black,
                ),
              ),
            ],
          ),
          Divider(color: Appcolors.orange, thickness: 1, height: 20),

          ...List.generate(paymentOptions.length, (index) {
            final payment = paymentOptions[index];
            return InkWell(
              onTap: () {
                onPaymentSelected(payment.paymentsId);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color:
                      selectedPaymentId == payment.paymentsId
                          ? Colors.grey.shade200
                          : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Radio<int?>(
                      value: payment.paymentsId,
                      groupValue: selectedPaymentId,
                      onChanged: onPaymentSelected,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "${payment.paymentsName}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: NetworkImage(
                        "${Linkapi.Patmentsiconssimage}/${payment.paymentsIcon}",
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            "${Linkapi.Patmentsiconssimage}/${payment.paymentsIcon}",
                        imageBuilder:
                            (context, imageProvider) => CircleAvatar(
                              radius: 25,
                              backgroundImage: imageProvider,
                            ),
                        placeholder:
                            (context, url) =>
                                const CircularProgressIndicator(strokeWidth: 2),
                        errorWidget:
                            (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
