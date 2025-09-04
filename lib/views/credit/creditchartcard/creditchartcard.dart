import 'package:banktest/models/credit_profile.dart';
import 'package:flutter/material.dart';
import 'package:banktest/views/credit/creditchartcard/creditchart.dart';

class CreditChartCard extends StatelessWidget {
  final int currentScoreChange;
  final String lastUpdated;
  final String creditService;
  final List<MonthlyCreditScore> scoreHistory;

  const CreditChartCard({
    super.key,
    required this.currentScoreChange,
    required this.lastUpdated,
    required this.creditService,
    required this.scoreHistory,
  });

  @override
  Widget build(BuildContext context) {
    var currentScoreChangeLabel = "";
    List<int> creditScores = scoreHistory.map((e) => e.score).toList();
    if (currentScoreChange >= 0) {
      currentScoreChangeLabel = "+${currentScoreChange}pts";
    } else {
      currentScoreChangeLabel = "-${currentScoreChange}pts";
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16,0,16,0),
          child: Container(
            padding: EdgeInsets.fromLTRB(8,32,0,0),
            child: Text(
              "Chart",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2A1E39),
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.fromLTRB(16,0,16,0),
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
              padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                            "Credit Score",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            )
                        ),
                        SizedBox(width: 8),
                        Chip(
                          label: Text(currentScoreChangeLabel, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFFFFFFFF))),
                          labelPadding: EdgeInsets.symmetric(horizontal: 6.0),
                          backgroundColor: Color(0xFF48A388),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                        "Updated Today • Next May 12",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF736B7C)
                        )
                    ),
                    SizedBox(height: 10),
                    Text(
                        creditService,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFA448FF),
                        )
                    ),
                    SizedBox(height: 16),
                    CreditChart(creditScores: creditScores),
                    SizedBox(height: 8),
                    Center(
                      child: Text(
                          "Last 12 months",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          )
                      ),
                    ),
                    Center(child: Text(
                        "Score calculated using VantageScore 3.0",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF736B7C)
                        )
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}