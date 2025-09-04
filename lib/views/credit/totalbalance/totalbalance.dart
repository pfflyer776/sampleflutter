import 'package:flutter/material.dart';
import 'package:banktest/views/credit/creditscorecard/circularscorewidget.dart';
import 'package:banktest/views/credit/totalbalance/creditutilizationbar.dart';

class TotalBalance extends StatelessWidget {
  final double totalBalance;
  final double totalLimit;
  final int utilizationPercent;
  final String utilizationLabel;
  final double percent;

  const TotalBalance({
    super.key,
    required this.totalBalance,
    required this.totalLimit,
    required this.utilizationPercent,
    required this.utilizationLabel,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Total balance: ',
                          style: TextStyle(color: Colors.black87),
                          children: [
                            TextSpan(
                              text: '\$${totalBalance.toStringAsFixed(0)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF49C6AC), // Minty green
                              ),
                            ),
                          ],
                        ),
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text("Total limit: \$${totalLimit.toStringAsFixed(0)}", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Spacer(),
                  CircularScoreWidget(score: "$utilizationPercent%", label: utilizationLabel, progress: percent, reverse: false),
                ],
              ),
              SizedBox(height: 8),
              CreditUtilizationBar(label: "Excellent"),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}