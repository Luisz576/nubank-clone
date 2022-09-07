import 'package:flutter/material.dart';
import 'package:nubank/utils/app_colors.dart';

class NewBox extends StatelessWidget {
  final double width;
  final String text;
  const NewBox({required this.width, required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.grayColor,
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 40, 15),
            child: Text(text,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontSize: 14
            ),
          ),
        ),
      ),
    );
  }
}