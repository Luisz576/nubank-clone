import 'package:flutter/material.dart';

class SecretText extends StatelessWidget {
  final Color? color;
  final double radius, padding;
  const SecretText({this.color, required this.radius, required this.padding, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: radius,
        ),
        SizedBox(
          width: padding,
        ),
        CircleAvatar(
          backgroundColor: color,
          radius: radius,
        ),
        SizedBox(
          width: padding,
        ),
        CircleAvatar(
          backgroundColor: color,
          radius: radius,
        ),
        SizedBox(
          width: padding,
        ),
        CircleAvatar(
          backgroundColor: color,
          radius: radius,
        ),
      ],
    );
  }
}