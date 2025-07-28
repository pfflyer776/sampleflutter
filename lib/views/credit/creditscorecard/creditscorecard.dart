import 'package:flutter/material.dart';

import 'package:avatest/views/credit/creditscorecard/circularscorewidget.dart';

class CreditScoreCard extends StatelessWidget {
  final int currentScore;
  final String currentScoreLabel;
  final int currentScoreChange;
  final String lastUpdated;
  final String creditService;

  const CreditScoreCard({
    super.key,
    required this.currentScore,
    required this.currentScoreLabel,
    required this.currentScoreChange,
    required this.lastUpdated,
    required this.creditService,
  });

  @override
  Widget build(BuildContext context) {
    var currentScoreChangeLabel = "";
    if (currentScoreChange >= 0) {
      currentScoreChangeLabel = "+${currentScoreChange}pts";
    } else {
      currentScoreChangeLabel = "-${currentScoreChange}pts";
    }
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 4, 16),
        child: Row(
          children: [
             Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Credit Score", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0XFF2A1E39))),
                          SizedBox(width: 8),
                          Chip(
                            label: Text(currentScoreChangeLabel, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFFFFFFFF))),
                            labelPadding: EdgeInsets.symmetric(horizontal: 6.0),
                            backgroundColor: Color(0xFF48A388),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(lastUpdated, style: TextStyle(fontSize: 14, color: Color(0xFF736B7C))),
                      SizedBox(height: 8),
                      Text(creditService, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFFA448FF))),
                    ],
                  ),
                ],
              ),
            Spacer(),
            CircularScoreWidget(score: currentScore, label: currentScoreLabel, progress: 0.7),
          ],
        ),
      ),
    );

  }
}