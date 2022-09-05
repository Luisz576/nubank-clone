import 'package:flutter/material.dart';
import 'package:nubank/screens/home_screen.dart';
import 'package:nubank/utils/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  // THIS PAGE ISN'T IMPLEMENTED, SO IT'S JUST USED IN CASE SOME ERROR HAPPENS
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightPurpleColor,
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppColors.lightOrangeColor,
            ),
            onPressed: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) => const HomeScreen()
              ), (route) => false);
            },
            child: const Text("Login",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            )
          ),
        ),
      )
    );
  }
}