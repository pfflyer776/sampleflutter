import 'package:flutter/material.dart';
import 'package:banktest/views/credit/creditscorecard/circularscorewidget.dart';

class CreditScoreCard extends StatelessWidget {
  final int currentScore;
  final String currentScoreLabel;
  final int currentScoreChange;
  final String lastUpdated;
  final String creditService;
  final double percent;

  const CreditScoreCard({
    super.key,
    required this.currentScore,
    required this.currentScoreLabel,
    required this.currentScoreChange,
    required this.lastUpdated,
    required this.creditService,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    var currentScoreChangeLabel = "";
    if (currentScoreChange >= 0) {
      currentScoreChangeLabel = "+${currentScoreChange}pts";
    } else {
      currentScoreChangeLabel = "-${currentScoreChange}pts";
    }
    return
      ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          child: Container(
            color: Color(0xFF4B0082),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: Card(
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
                          CircularScoreWidget(score: currentScore.toString(), label: currentScoreLabel, progress: percent, reverse: true),
                        ],
                      ),
                    ),
                  ),
            ),
          ),
      );
  }
}