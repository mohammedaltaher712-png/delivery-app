import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:order_delivery_application/core/functions/ordersdetilsdelivery.dart';

class Customcardstats extends StatelessWidget {
  const Customcardstats({
    super.key,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4, required this.satsus,
  });
  final String title1;
  final String title2;
  final String title3;
  final String title4;
  final int satsus;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.3),
      margin: EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  title1,
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
                SizedBox(height: 6),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                   
                        color: satsus == 1 ? Colors.green : Colors.red,

                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    printstatus(title2),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(width: 1, height: 50, color: Colors.grey[300]),
            Column(
              children: [
                Text(
                  title3,
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
                SizedBox(height: 6),
                Text(
                  title4,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
