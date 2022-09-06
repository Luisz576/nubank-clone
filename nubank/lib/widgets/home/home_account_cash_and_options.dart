import 'package:flutter/material.dart';
import 'package:nubank/models/user_data.dart';
import 'package:nubank/notifiers/simple_notifier.dart';
import 'package:nubank/utils/app_colors.dart';

class HomeAccountCashAndOptions extends StatelessWidget {
  final SimpleNotifier<UserData> userDataNotifier;
  final bool cashVisible;
  const HomeAccountCashAndOptions({this.cashVisible = false, required this.userDataNotifier, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: Text("Conta",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.arrow_forward_ios,
                      size: 18,
                      color: AppColors.blackColor,
                    )
                  ),
                ),
              ),
            ],
          ),
          cashVisible ?
            ValueListenableBuilder<UserData>(
              valueListenable: userDataNotifier.listenable,
              builder: (context, value, child) => Align(
                alignment: Alignment.centerLeft,
                child: Text("R\$${value.totalCash.toStringAsPrecision(3)}",
                  style: const TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            )
          : Row(
            children: const [
              CircleAvatar(
                backgroundColor: AppColors.blackColor,
                radius: 5,
              ),
              SizedBox(
                width: 2,
              ),
              CircleAvatar(
                backgroundColor: AppColors.blackColor,
                radius: 5,
              ),
              SizedBox(
                width: 2,
              ),
              CircleAvatar(
                backgroundColor: AppColors.blackColor,
                radius: 5,
              ),
              SizedBox(
                width: 2,
              ),
              CircleAvatar(
                backgroundColor: AppColors.blackColor,
                radius: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}