import 'package:flutter/painting.dart';

class AppIndicatorTab extends Decoration {
  final Color color;
  final num width;
  final double thickness;
  final double radius;

  const AppIndicatorTab({required this.color, required this.width, required this.thickness, this.radius = 0});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _AppIndicatorTabPaint(color: color, radius: radius, thickness: thickness, size: width);
  }
}

class _AppIndicatorTabPaint extends BoxPainter {
  final Color color;
  final num size;
  final double thickness;
  final double radius;

  _AppIndicatorTabPaint({required this.color, required this.size, required this.thickness, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    var paint = Paint();
    paint.color = color;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = thickness;
    paint.isAntiAlias = true;

    var bottom = configuration.size!.height;
    //Circle
    var newOffset = Offset(offset.dx + configuration.size!.width / 2, bottom - thickness / 2 - 1);
    canvas.drawCircle(newOffset, thickness /*radius*/, paint);
    //Line
    var newOffset1 = Offset(offset.dx + configuration.size!.width / 2 - size / 2, bottom - 2 * thickness - 1.5);
    var newOffset2 = Offset(offset.dx + configuration.size!.width / 2 + size / 2, bottom - 2 * thickness - 1.5);
    canvas.drawLine(newOffset1, newOffset2, paint);
  }
}
