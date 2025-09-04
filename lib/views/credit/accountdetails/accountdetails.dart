import 'package:banktest/views/credit/accountdetails/spendlimitindicator.dart';
import 'package:flutter/material.dart';
import 'package:banktest/models/credit_profile.dart';

class Accountdetails extends StatelessWidget {
  final CreditDetails details;
  double percent;

  Accountdetails({
    required this.details,
    required this.percent
  });

  @override
  Widget build(BuildContext context) {
    percent = percent * 100;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16,0,16,0),
          child: Container(
            padding: EdgeInsets.fromLTRB(8,32,0,0),
            child: Text(
              "Account details",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2A1E39),
              ),
            ),
          ),
        ),
        Container(
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
                          Text("\$${details.balance.toStringAsFixed(0)}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          Text("Balance"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("\$${details.creditLimit.toStringAsFixed(0)}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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
                          Text("${percent.toStringAsFixed(0)}%", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}