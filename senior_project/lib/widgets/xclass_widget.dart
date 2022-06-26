import 'package:flutter/material.dart';

class XclassWidget extends StatelessWidget {
  Color color;
  IconData icon;
  double size;
  XclassWidget({required this.color, required this.icon, required this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}
