import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rzq_customer/providers/authentication_provider.dart';
import 'package:rzq_customer/screens/edit_profile/edit_profile_screen.dart';
import 'package:rzq_customer/screens/widgets/auth/signin_button.dart';
import 'package:rzq_customer/screens/widgets/categories_list.dart';
import 'package:rzq_customer/styles/app_const.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Consumer<AuthenticationProvider>(
          builder: (context, _auth, child) => Container(
            color:Theme.of(context).backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                  constraints: BoxConstraints(minHeight:200),
                  child: Stack(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InkWell(
                        onTap: () => _auth.isAuth
                            ? Navigator.pushNamed(
                                context, EditProfileScreen.nav)
                            : null,
                        child: Icon(
                          Platform.isAndroid
                              ? Icons.account_circle_sharp
                              : CupertinoIcons.profile_circled,
                          size: AppConst.lIcon,
                          color: Colors.grey.shade500,
                        )),
                      Padding(
                        padding: const EdgeInsets.only(top:  5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          FittedBox(
                          child: Text(
                            _auth.isAuth
                                ? _auth.user.email!
                                : "مرحبا زائرنا الكريم",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        if (!_auth.isAuth) SigninButton(),
                        ],),
                      )
                      
                    ],
                  ),
                  Positioned(child: Icon(Platform.isAndroid ? Icons.settings : CupertinoIcons.settings,size: AppConst.mIcon,),top: 3,left: 3,)
                  ],)
                ),
                CategoriesList(),
             
              ],
            ),
          ),
        ),
      ),
    );
  }
}
