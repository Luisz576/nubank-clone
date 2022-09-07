import 'package:flutter/material.dart';
import 'package:nubank/utils/app_colors.dart';

class CircularRetanguloButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const CircularRetanguloButton({required this.text, required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.grayColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(text,
          style: const TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}