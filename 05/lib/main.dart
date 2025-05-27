import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(TriangleApp());

class TriangleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TrianglePainterScreen(),
    );
  }
}

class TrianglePainterScreen extends StatefulWidget {
  @override
  _TrianglePainterScreenState createState() => _TrianglePainterScreenState();
}

class _TrianglePainterScreenState extends State<TrianglePainterScreen> {
  List<Offset> points = [
    Offset(100, 200),
    Offset(200, 400),
    Offset(300, 200),
  ];

  int? selectedPointIndex;

  static const double touchRadius = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tam giác tương tác')),
      body: GestureDetector(
        onPanStart: (details) {
          final pos = details.localPosition;
          for (int i = 0; i < points.length; i++) {
            if ((points[i] - pos).distance < touchRadius) {
              selectedPointIndex = i;
              break;
            }
          }
        },
        onPanUpdate: (details) {
          if (selectedPointIndex != null) {
            setState(() {
              points[selectedPointIndex!] += details.delta;
            });
          }
        },
        onPanEnd: (_) {
          selectedPointIndex = null;
        },
        child: CustomPaint(
          painter: TrianglePainter(points),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final List<Offset> points;
  TrianglePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paintTriangle = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final paintPoints = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(points[0].dx, points[0].dy)
      ..lineTo(points[1].dx, points[1].dy)
      ..lineTo(points[2].dx, points[2].dy)
      ..close();

    canvas.drawPath(path, paintTriangle);

    for (var p in points) {
      canvas.drawCircle(p, 10, paintPoints);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
