import 'package:flutter/material.dart';


class Heart extends StatefulWidget {

  final bool repaintWithRed;
  Heart({super.key,this.repaintWithRed = false});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HeartPainter(
        backgroundColor: (widget.repaintWithRed?Colors.red:Colors.white)
      ),
    );
  }
}


class HeartPainter extends CustomPainter {

  final Color backgroundColor;
  final Color strokeColor;
  HeartPainter({this.backgroundColor = Colors.white,this.strokeColor = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint painter = Paint();
    painter
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    double width = size.width;
    double height = size.height;

    Paint backgroundPainter = Paint();
    backgroundPainter
      ..color = backgroundColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    Path path = Path();
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
        0.5 * width, height);
    path.moveTo(0.5 * width, height * 0.35);
    path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
        0.5 * width, height);

    canvas.drawPath(path, backgroundPainter);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}