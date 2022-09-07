import 'package:flutter/material.dart';
import 'package:nubank/models/user_data.dart';
import 'package:nubank/notifiers/simple_notifier.dart';
import 'package:nubank/utils/app_colors.dart';
import 'package:nubank/widgets/circular_retangulo_button.dart';
import 'package:nubank/widgets/secret_text.dart';

class HomeCreditCardInfo extends StatelessWidget {
  final SimpleNotifier<UserData> userDataNotifier;
  final bool cashVisible;
  const HomeCreditCardInfo({required this.userDataNotifier, this.cashVisible = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: Text("Cartão de Crédito",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
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
          const Text("Fatura atual",
            style: TextStyle(
              color: AppColors.darkGrayColor,
              fontWeight: FontWeight.w600,
              fontSize: 13
            ),
          ),
          const SizedBox(height: 10,),
          cashVisible ? ValueListenableBuilder<UserData>(
            valueListenable: userDataNotifier.listenable,
            builder: (context, value, child) => Text("R\$${value.invoice.toStringAsFixed(2)}",
              style: const TextStyle(
                color: AppColors.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          ) : const SecretText(
            color: AppColors.blackColor,
            radius: 5,
            padding: 2
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              const Text("Limite disponível R\$",
                style: TextStyle(
                  color: AppColors.darkGrayColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w500
                ),
              ),
              cashVisible ? ValueListenableBuilder<UserData>(
                valueListenable: userDataNotifier.listenable,
                builder: (context, value, child) => Text((value.cardLimit - value.invoice).toStringAsFixed(2),
                  style: const TextStyle(
                    color: AppColors.darkGrayColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ) : const SecretText(
                color: AppColors.darkGrayColor,
                radius: 3.5,
                padding: 1.5,
              ),
            ],
          ),
          const SizedBox(height: 4,),
          Row(
            children: [
              const Text("Débito automárico: ",
                style: TextStyle(
                  color: AppColors.darkGrayColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w500
                ),
              ),
              ValueListenableBuilder<UserData>(
                valueListenable: userDataNotifier.listenable,
                builder: (context, value, child){
                  return Text(value.automaticDebitActive ? "Ativado" : "Desativado",
                    style: TextStyle(
                      color: value.automaticDebitActive ? AppColors.green : AppColors.red,
                      fontSize: 13,
                      fontWeight: FontWeight.w500
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 20,),
          CircularRetanguloButton(
            text: "Parcelar compras",
            onPressed: (){},
          )
        ],
      ),
    );
  }
}