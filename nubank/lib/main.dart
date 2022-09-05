import 'package:flutter/material.dart';
import 'package:nubank/screens/auth_screen.dart';

void main(){
  runApp(const NubankApp());
}

class NubankApp extends StatelessWidget{
  const NubankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: "Nubank Clone",
      debugShowCheckedModeBanner: false,
      home: AuthScreen()
    );
  }
}