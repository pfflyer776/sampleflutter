import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SpendLimitIndicator extends StatefulWidget {
  @override
  SpendLimitIndicatorState createState() => SpendLimitIndicatorState();
}

class SpendLimitIndicatorState extends State<SpendLimitIndicator> {
  double leftPosition = 0.0;
  final markerWidth = 4.0;
  double markerLeft = 0.0;
  bool hasAnimated = false;

  void triggerAnimation() {
    setState(() {
      markerLeft = 100 - markerWidth / 2;
      hasAnimated = true;
    });
  }



  @override
  Widget build(BuildContext context) {
    final markerHeight = 8.0;
    final labelWidth = 60.0;
    final labelLeft = 75 - labelWidth / 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final lineWidth = constraints.maxWidth;
            return SizedBox(
              height: 110,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Green line, fixed width 600
                  Positioned(
                    top: 90,
                    left: 0,
                    child: Container(
                      width: lineWidth,
                      height: 8,
                      color: Color(0xFFA9EACE),
                    ),
                  ),

                  // Animated marker rectangle at markerPositionPx pixels
                  VisibilityDetector(
                    key: Key('marker'),
                    onVisibilityChanged: (VisibilityInfo info) {
                      if (info.visibleFraction == 1.0 && !hasAnimated) {
                        triggerAnimation();
                      }
                    },
                   child: SizedBox.expand(),

                  ),

                  AnimatedPositioned(
                    duration: Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                    top: 94 - markerHeight / 2,
                    left: markerLeft,
                    child: Container(
                      width: markerWidth,
                      height: markerHeight,
                      decoration: BoxDecoration(
                        color: Colors.green[800],
                      ),
                    ),
                  ),

                  // Fixed $75 label at 75 px
                  Positioned(
                    top: 20,
                    left: labelLeft,
                    child: Column(
                      children: [
                        Container(
                          width: labelWidth,
                          padding: EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            color: Color(0xFF420085),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              "\$75",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        CustomPaint(
                          size: Size(20, 10),
                          painter: _TrianglePainter(color: Color(0xFF420085)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ],
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;

  _TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_TrianglePainter oldDelegate) =>
      oldDelegate.color != color;
}
