import 'package:avatest/views/credit/accountdetails/spendlimitindicator.dart';
import 'package:flutter/material.dart';

class Accountdetails extends StatelessWidget {
  final Color primaryColor = Color(0xFF4B0082); //

  @override
  Widget build(BuildContext context) {
    final int balance = 30;
    final int creditLimit = 600;
    final int utilPercent = 4;

    return Container(
      padding: const EdgeInsets.fromLTRB(16,0,16,0),
      child: Card(
        elevation: 3,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Color(0xFFE5E5E5),
                width: 1
            ),
            borderRadius: BorderRadius.circular(16)
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpendLimitIndicator(),
              Center(
                child: Text(
                  "Spend Limit",
                  style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("\$$balance", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      Text("Balance"),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("\$$creditLimit", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      Text("Credit limit", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Utilization", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("$utilPercent%", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}