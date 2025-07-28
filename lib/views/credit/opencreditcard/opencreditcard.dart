import 'package:flutter/material.dart';

class OpenCreditCard extends StatelessWidget {
  const OpenCreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                _creditAccountTile("Syncb/Amazon", "21%", "\$1,500", "\$6,300"),
                _creditAccountTile("Syncb/Amazon", "21%", "\$1,500", "\$6,300"),
                _creditAccountTile("Syncb/Amazon", "21%", "\$1,500", "\$6,300"),
              ]
          ),
        ),
      ),
    );
  }

  Widget _creditAccountTile(String name, String percent, String balance, String limit) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(percent, style: TextStyle(color: Colors.black54)),
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
            Text("Reported on June 20, 2023",
                style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}


