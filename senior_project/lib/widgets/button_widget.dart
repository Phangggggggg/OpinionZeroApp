import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  VoidCallback? onTap;
  Color activeColor;
  Color inactiveColor;
  bool active;
  double width;
  double height;
  Widget widget;
  String? text;

  ButtonWidget(
      { this.onTap,
      required this.activeColor,
      required this.inactiveColor,
        required this.active,
      required this.widget,
      required this.height,
      required this.width,
      this.text}
    );

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          child: Center(child: widget),
          margin: EdgeInsets.all(5.0),
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(color: activeColor,width: 1.5),
            color: active ? activeColor : inactiveColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ));
  }
}
