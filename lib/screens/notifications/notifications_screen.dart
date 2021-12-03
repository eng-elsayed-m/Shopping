import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rzq_customer/providers/authentication_provider.dart';
import 'package:rzq_customer/screens/widgets/auth/signin_button.dart';
import 'package:rzq_customer/styles/app_const.dart';
import 'package:rzq_customer/styles/colors.dart';

class NotificationsScreen extends StatelessWidget {
  static const nav = "/notifications";
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("الاشعارات"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(AppConst.defaultPadding),
                child: Icon(
                  Icons.notifications_active_outlined,
                  size: 70,
                  color: AppColors.primary,
                ),
              ),
              Consumer<AuthenticationProvider>(
                builder: (context, _auth, child) => _auth.isAuth
                    ? Text("صندوق الاشعارات فارغ")
                    : Padding(
                        padding: const EdgeInsets.all(AppConst.defaultPadding),
                        child: SigninButton(),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
