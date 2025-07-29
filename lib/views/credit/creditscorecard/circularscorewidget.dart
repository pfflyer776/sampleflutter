import 'dart:math';
import 'package:flutter/material.dart';

class CircularScoreWidget extends StatelessWidget {
  final String score;
  final String label;
  final double progress; // from 0.0 to 1.0
  final bool reverse;

  const CircularScoreWidget({
    super.key,
    required this.score,
    required this.label,
    required this.progress,
    required this.reverse,
  });

  @override
  Widget build(BuildContext context) {
    final Color progressColor = Colors.teal.shade400; // lighter teal for progress

    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: reverse ? pi : 0, // 180 degrees (starts from bottom)
            child: SizedBox(
              width: 80,
              height: 80,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: progress),
                duration: Duration(seconds: 1),
                builder: (context, value, child) {
                  return CircularProgressIndicator(
                    value: value,
                    strokeWidth: 6,
                    color: progressColor,
                    backgroundColor: progressColor.withOpacity(0.2),
                  );
                }
              ),
            ),
          ),
          // Score and label
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$score',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2A1E39),
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2A1E39),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
