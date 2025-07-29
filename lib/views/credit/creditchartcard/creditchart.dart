import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CreditChart extends StatefulWidget {
  final List<int> creditScores;

  const CreditChart({
    super.key,
    required this.creditScores,
  });

  @override
  CreditChartState createState() => CreditChartState();

}

class CreditChartState extends State<CreditChart>  {
  bool showChart = false;

  @override
  void initState() {
    super.initState();
    // Delay and then trigger animation
    Future.delayed(Duration(milliseconds: 900), () {
      setState(() {
        showChart = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: LineChart(
        LineChartData(
          minX: -0.5,
          maxX: 11.5,
          minY: 590,
          maxY: 710,
          gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              drawHorizontalLine: true,
              horizontalInterval: 50,
              getDrawingHorizontalLine: (value) {
                return FlLine(color: Colors.grey[300]!, strokeWidth: 1);
              },
          ),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                interval: 50,
                getTitlesWidget: (value, meta) {
                  if (value == 600 || value == 650 || value == 700) {
                    return Text(
                        value.toInt().toString(),
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF736B7C),
                        )
                    );
                  }
                  return Container();
                },
              ),
            ),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          lineBarsData: [
            showChart ? LineChartBarData(
              spots: [
                for (int i = 0; i < widget.creditScores.length; i++)
                  FlSpot(i.toDouble(), widget.creditScores[i].toDouble()),
              ],
              isCurved: false,
              barWidth: 2,
              color: Colors.teal,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, _, __, ___) {
                  return FlDotCirclePainter(
                    radius: 3,
                    color: Colors.white,
                    strokeWidth: 2,
                    strokeColor: Colors.teal,
                  );
                },
              ),
              belowBarData: BarAreaData(show: false),
            )
                :
            LineChartBarData(
              spots: [

              ],
              isCurved: false,
              barWidth: 2,
              color: Colors.teal,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, _, __, ___) {
                  return FlDotCirclePainter(
                    radius: 3,
                    color: Colors.white,
                    strokeWidth: 2,
                    strokeColor: Colors.teal,
                  );
                },
              ),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
        duration: Duration(milliseconds: 800),
        curve: Curves.linear,
      ),
    );
  }
}
