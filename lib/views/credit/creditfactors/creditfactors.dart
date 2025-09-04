import 'package:flutter/material.dart';
import 'package:banktest/models/credit_profile.dart';

class CreditFactors extends StatelessWidget {
  final List<CreditFactor> creditFactors;

  const CreditFactors({
    required this.creditFactors,
  });

  // factors used in Credit Karma:
  // Payment History - % of on-time payments
  // Credit Card Utilization - % of credit card used
  // Derogatory Marks - number of marks
  // Age of Credit History - number of years
  // Total Accounts - number of accounts
  // Hard Inquiries - number of inquiries
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16,0,16,0),
          child: Container(
            padding: EdgeInsets.fromLTRB(8,32,0,0),
            child: Text(
              "Credit factors",
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
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for(var factor in creditFactors)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _factorTile(factor.title, factor.value.toString(), factor.status),
                  )
              ],
            ),
          ),
        ),
      ],
    );

  }

  Widget _factorTile(String title, String value, String impact) {
    Color colorButton;
    Color colorText;
    switch (impact) {
      case "HIGH IMPACT":
        colorButton = Color(0xFF003928);
        colorText = Colors.white;
        break;
      case "MEDIUM IMPACT":
        colorButton = Color(0xFFA9EACE);
        colorText = Color(0xFF003928);
        break;
      case "LOW IMPACT":
        colorButton = Color(0xFF48A388);
        colorText = Colors.white;
        break;
      default:
        colorButton = Color(0xFF48A388);
        colorText = Colors.white;
    }
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Color(0xFFE5E5E5),
              width: 1
          ),
          borderRadius: BorderRadius.circular(16)
      ),
      child: SizedBox(
        width: 144,
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
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.visible
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