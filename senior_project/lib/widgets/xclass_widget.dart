import 'package:flutter/material.dart';

class XclassWidget extends StatelessWidget {
  Color color;
  IconData icon;
  double size;
  int diff;
  XclassWidget(
      {required this.color,
      required this.icon,
      required this.size,
      required this.diff});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        diff == 1
            ? Icon(
                icon,
                size: size,
                color: color,
              )
            : Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Text("you voted"),
                  ),
                  Icon(
                    icon,
                    size: size,
                    color: color,
                  ),
                ],
              ),
      ],
    );
  }
}
