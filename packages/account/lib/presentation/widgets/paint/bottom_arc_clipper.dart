import 'package:flutter/rendering.dart';

class BottomArcClipper extends CustomClipper<Path> {
  BottomArcClipper({super.reclip, this.radius = 16});

  final double radius;
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..arcToPoint(
        Offset(radius, size.height - radius),
        radius: Radius.circular(radius),
      )
      ..lineTo(size.width - radius, size.height - radius)
      ..arcToPoint(
        Offset(size.width, size.height),
        radius: Radius.circular(radius),
      )
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
