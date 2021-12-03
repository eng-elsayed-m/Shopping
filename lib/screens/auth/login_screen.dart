import 'package:flutter/material.dart';
import 'package:rzq_customer/screens/widgets/auth/login_form.dart';

class LoginScreen extends StatefulWidget {
  static const nav = "/login";
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 50.0, left: 12.0, right: 12.0),
                child: Row(
                  children: [
                    Text(
                      "تسجيل الدخول",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.cancel_presentation,
                        color: Colors.red,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              Material(
                elevation: 8,
                color: Colors.grey,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.cover,
                  width: 120,
                  height: 120,
                  isAntiAlias: true,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "مرحبا بك",
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "برجاء تسجيل الدخول لمتابعة التسوق",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(
                height: 10,
              ),
              LoginForm()
            ],
          ),
        ),
      ),
    );
  }
}
