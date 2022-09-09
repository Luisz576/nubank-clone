import 'package:flutter/material.dart';
import 'package:nubank/screens/home_screen.dart';
import 'package:nubank/screens/login_screen.dart';
import 'package:nubank/services/auth.dart';
import 'package:nubank/utils/app_colors.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState(){
    super.initState();
    _tryAuth();
  }

  _tryAuth(){
    Auth.tryAuth().then((result){
      if(result){
        Navigator.pushAndRemoveUntil(
          context,
          //TODO: change animation
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => const HomeScreen(),
            transitionsBuilder: (context, animation, animation2, child) => FadeTransition(opacity: animation, child: child),
            transitionDuration: const Duration(seconds: 2),
          ),
          (route) => false
        );
      }else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) => const LoginScreen()
        ), (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightPurpleColor,
        body: Column(
          children: [
            const Expanded(
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.whiteColor,
                ),
              )
            ),
            Expanded(
              child: IconButton(
                onPressed: _tryAuth,
                icon: const Icon(Icons.install_mobile_rounded,
                  color: AppColors.whiteColor,
                  size: 32,
                )
              )
            ),
          ],
        ),
      )
    );
  }
}