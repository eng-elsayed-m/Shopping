import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rzq_customer/screens/auth/login_screen.dart';
import 'package:rzq_customer/styles/colors.dart';

class SigninButton extends StatelessWidget {
  const SigninButton({
    Key? key,
  }) : super(key: key);

   Widget _androidButton(BuildContext context){  return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.primary),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("تسجيل الدخول"),
        ),
        onPressed: () => Navigator.pushNamed(context, LoginScreen.nav));}

        Widget _iosButton(BuildContext context){  return TextButton(
          
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("تسجيل الدخول",style: TextStyle(color:Colors.blue),),
        ),
        onPressed: () => Navigator.pushNamed(context, LoginScreen.nav));}

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? _androidButton(context): _iosButton(context);
  }
 
}
