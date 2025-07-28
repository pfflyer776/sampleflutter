import 'package:flutter/material.dart';

class CreditUtilizationBar extends StatelessWidget {
  final String label;

  const CreditUtilizationBar({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    // Flex for proportional widths
    final greenFlex = 30;
    final peachFlex = 20;
    final pinkFlex = 25;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
          style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF3C9C84)),
        ),
        const SizedBox(height: 8),

        LayoutBuilder(builder: (context, constraints) {
          final total = greenFlex + peachFlex + pinkFlex;
          final width = constraints.maxWidth;

          // Compute pixel positions:
          final posGreenStart = 0.0;
          final posGreenEnd = greenFlex / total * width;         // end of green
          final posPeachMid = (greenFlex + peachFlex / 2) / total * width; // center of peach
          final posPinkStart = (greenFlex + peachFlex) / total * width;    // left edge of pink
          final posPinkEnd = width; // right edge of pink

          return Stack(
            clipBehavior: Clip.none,
            children: [
              // Colored segments
              Row(children: [
                Flexible(flex: greenFlex,  child: Container(color: Color(0xFF3C9C84), height: 16)),
                Flexible(flex: peachFlex, child: Container(color: Color(0xFFFAD8A8), height: 16)),
                Flexible(flex: pinkFlex,  child: Container(color: Color(0xFFF6C4C4), height: 16)),
              ]),

              // Divider between segments
              Positioned.fill(
                child: Row(children: [
                  Flexible(flex: greenFlex,  child: Align(alignment: Alignment.centerRight, child: Container(width: 1, height: 16, color: Colors.white))),
                  Flexible(flex: peachFlex, child: Align(alignment: Alignment.centerRight, child: Container(width: 1, height: 16, color: Colors.white))),
                  Flexible(flex: pinkFlex,  child: Container()),
                ]),
              ),

              // Labels
              Positioned(top: 24, left: posGreenStart, child: const Text('0–9%',  style: TextStyle(fontSize: 11, color: Colors.black54))),
              Positioned(top: 24, left: posGreenEnd - 40, child: const Text('10–29%', style: TextStyle(fontSize: 11, color: Colors.black54))),
              Positioned(top: 24, left: posPeachMid - 16, child: const Text('30–49%', style: TextStyle(fontSize: 11, color: Colors.black54))),
              Positioned(top: 24, left: posPinkStart, child: const Text('50–75%', style: TextStyle(fontSize: 11, color: Colors.black54))),
              Positioned(top: 24, left: posPinkEnd - 32, child: const Text('<75%', style: TextStyle(fontSize: 11, color: Colors.black54))),
            ],
          );
        }),
      ],
    );
  }
}
