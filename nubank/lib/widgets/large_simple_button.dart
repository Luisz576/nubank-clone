import 'package:flutter/material.dart';
import 'package:nubank/utils/app_colors.dart';

class LargeSimpleButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const LargeSimpleButton({required this.icon, required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.grayColor,
      child: InkWell(
        onTap: (){},
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Icon(icon,
                  color: AppColors.blackColor,
                  size: 24,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(text,
                  style: const TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}