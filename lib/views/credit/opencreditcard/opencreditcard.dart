import 'package:flutter/material.dart';
import 'package:avatest/models/credit_profile.dart';

class OpenCreditCard extends StatelessWidget {
  final List<CreditCardAccount> openCreditCards;

  const OpenCreditCard({
    required this.openCreditCards,
  });

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
              "Open credit card accounts",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2A1E39),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
                    for(var cards in openCreditCards)
                      _creditAccountTile(cards.name, "${((cards.balance / cards.limit) * 100).toStringAsFixed(0)}%", "\$${cards.balance.toStringAsFixed(0)}", "\$${cards.limit.toStringAsFixed(0)}", cards.lastReport),
                  ]
              ),
            ),
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }

  Widget _creditAccountTile(String name, String percent, String balance, String limit, String lastReport) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(percent, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.21,
              backgroundColor: Colors.grey[300],
              color: Colors.green,
              minHeight: 6,
              borderRadius: BorderRadius.circular(4),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$balance Balance"),
                Text("$limit Limit"),
              ],
            ),
            SizedBox(height: 4),
            Text(lastReport,
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
    );
  }
}


