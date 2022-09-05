import 'package:flutter/material.dart';
import 'package:nubank/models/user_data.dart';
import 'package:nubank/notifiers/simple_notifier.dart';

class HomeCreditCardInfo extends StatelessWidget {
  final SimpleNotifier<UserData> userDataNotifier;
  final bool cashVisible;
  const HomeCreditCardInfo({required this.userDataNotifier, this.cashVisible = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}