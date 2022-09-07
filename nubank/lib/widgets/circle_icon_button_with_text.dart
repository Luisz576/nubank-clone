import 'package:flutter/material.dart';

class CircleIconButtonWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final TextStyle? textStyle;
  final void Function() onPressed;
  final Color? iconColor, backgroundColor;
  final double? paddingBetweenIconAndText, circleRadius, iconSize;
  const CircleIconButtonWithText({required this.icon, required this.text, required this.onPressed, this.paddingBetweenIconAndText, this.iconColor, this.textStyle, this.iconSize, this.circleRadius, this.backgroundColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: circleRadius,
          backgroundColor: backgroundColor,
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon,
              color: iconColor,
              size: iconSize,
            ),
          ),
        ),
        SizedBox(height: paddingBetweenIconAndText ?? 10.0,),
        SizedBox(
          width: circleRadius != null ? circleRadius! * 2 : null,
          child: Text(text,
            textAlign: TextAlign.center,
            style: textStyle
          ),
        )
      ],
    );
  }
}