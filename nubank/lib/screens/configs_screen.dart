import 'package:flutter/material.dart';
import 'package:nubank/utils/app_colors.dart';

class ConfigsScreen extends StatelessWidget {
  const ConfigsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grayColor,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.darkGrayColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
      ),
      backgroundColor: AppColors.whiteColor,
      body: ListView(
        children: const [
          //TODO
        ],
      ),
    );
  }
}