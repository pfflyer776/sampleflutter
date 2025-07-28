import 'package:flutter/material.dart';

class CreditFactors extends StatelessWidget {

  // factors used in Credit Karma:
  // Payment History - % of on-time payments
  // Credit Card Utilization - % of credit card used
  // Derogatory Marks - number of marks
  // Age of Credit History - number of years
  // Total Accounts - number of accounts
  // Hard Inquiries - number of inquiries
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16,0,16,0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _factorTile("Payment History", "100%", "HIGH IMPACT", Color(0xFF003928), Colors.white),
          _factorTile("Credit Card Utilization", "4%", "LOW IMPACT", Color(0xFFA9EACE), Color(0XFF003928)),
          _factorTile("Derogatory Marks", "0", "MEDIUM IMPACT", Color(0xFF48A388), Colors.white ),
        ],
      ),
    );

  }

  Widget _factorTile(String title, String value, String impact, Color colorButton, Color colorText) {
    return Expanded(
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
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                  title,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.center
              ),
              SizedBox(height: 8),
              Text(
                  value,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600
                  )
              ),
              SizedBox(height: 4),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: colorButton,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                    impact,
                    style: TextStyle(
                        color: colorText,
                        fontWeight: FontWeight.w700,
                        fontSize: 11
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}