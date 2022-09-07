import 'package:flutter/material.dart';
import 'package:nubank/models/user_data.dart';
import 'package:nubank/notifiers/simple_notifier.dart';
import 'package:nubank/utils/app_colors.dart';
import 'package:nubank/widgets/circle_icon_button_with_text.dart';

class HomeAccountCashAndOptions extends StatelessWidget {
  final SimpleNotifier<UserData> userDataNotifier;
  final bool cashVisible;
  const HomeAccountCashAndOptions({this.cashVisible = false, required this.userDataNotifier, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
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
              const SizedBox(height: 30,),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 7,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 20,),
              CircleIconButtonWithText(
                icon: Icons.pix_outlined,
                text: "Área de Pix",
                circleRadius: 38,
                iconSize: 28,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14
                ),
                onPressed: (){},
                backgroundColor: AppColors.grayColor,
                iconColor: AppColors.blackColor,
              ),
              const SizedBox(width: 12,),
              CircleIconButtonWithText(
                icon: Icons.account_balance_sharp,
                text: "Pagar Boleto",
                circleRadius: 38,
                iconSize: 28,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                onPressed: (){},
                backgroundColor: AppColors.grayColor,
                iconColor: AppColors.blackColor,
              ),
              const SizedBox(width: 12,),
              CircleIconButtonWithText(
                icon: Icons.exit_to_app,
                text: "Transferir",
                circleRadius: 38,
                iconSize: 28,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14
                ),
                onPressed: (){},
                backgroundColor: AppColors.grayColor,
                iconColor: AppColors.blackColor,
              ),
              const SizedBox(width: 12,),
              CircleIconButtonWithText(
                icon: Icons.call_received,
                text: "Depositar",
                circleRadius: 38,
                iconSize: 28,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14
                ),
                onPressed: (){},
                backgroundColor: AppColors.grayColor,
                iconColor: AppColors.blackColor,
              ),
              const SizedBox(width: 12,),
              CircleIconButtonWithText(
                icon: Icons.attach_money,
                text: "Cobrar",
                circleRadius: 38,
                iconSize: 28,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14
                ),
                onPressed: (){},
                backgroundColor: AppColors.grayColor,
                iconColor: AppColors.blackColor,
              ),
              const SizedBox(width: 12,),
              CircleIconButtonWithText(
                icon: Icons.volunteer_activism_outlined,
                text: "Doar",
                circleRadius: 38,
                iconSize: 28,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14
                ),
                onPressed: (){},
                backgroundColor: AppColors.grayColor,
                iconColor: AppColors.blackColor,
              ),
              const SizedBox(width: 12,),
              CircleIconButtonWithText(
                icon: Icons.reduce_capacity_outlined,
                text: "Transferência Internacional",
                circleRadius: 38,
                iconSize: 28,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12
                ),
                onPressed: (){},
                backgroundColor: AppColors.grayColor,
                iconColor: AppColors.blackColor,
              ),
              const SizedBox(width: 12,),
              CircleIconButtonWithText(
                icon: Icons.signal_cellular_alt_sharp,
                text: "Investir",
                circleRadius: 38,
                iconSize: 28,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14
                ),
                onPressed: (){},
                backgroundColor: AppColors.grayColor,
                iconColor: AppColors.blackColor,
              ),
              const SizedBox(width: 20,),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Card(
            color: AppColors.grayColor,
            child: InkWell(
              onTap: (){},
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: const [
                      Icon(Icons.phone_android_outlined,
                        color: AppColors.blackColor,
                        size: 24,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Meus cartões",
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  )
                ),
              ),
            )
          ),
        ),
        //TODO: news
      ],
    );
  }
}