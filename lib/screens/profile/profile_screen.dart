import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rzq_customer/providers/authentication_provider.dart';
import 'package:rzq_customer/screens/widgets/auth/signin_button.dart';
import 'package:rzq_customer/screens/widgets/custom_tile.dart';
import 'package:rzq_customer/styles/app_const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  static const nav = "/profile";
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  openURL(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        universalLinksOnly: true,
      );
    } else {
      print("can't open ");
      throw 'There was a problem to open the url: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("الحساب"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppConst.defaultPadding),
                child: Center(
                  child: Consumer<AuthenticationProvider>(
                      builder: (context, _auth, child) => _auth.isAuth
                          ? ElevatedButton(
                              onPressed: () => _auth.logout(),
                              child: Text(
                                "تسجيل الخروج",
                              ))
                          : SigninButton()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppConst.defaultPadding),
                child: Text(
                  "وسائل التواصل",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),

              InkWell(
                onTap: () => openURL("whatsapp://send?phone=+912789456123"),
                child: CustomTile(
                  title: "واتساب",
                  icon: FontAwesomeIcons.whatsapp,
                ),
              ),
              const Divider(
                height: 0,
                thickness: 2,
              ),
              InkWell(
                onTap: () => openURL("tel://+912789456123"),
                child: CustomTile(
                  title: "الجوال",
                  icon: FontAwesomeIcons.mobileAlt,
                ),
              ),
              //***** */

              Padding(
                padding: const EdgeInsets.all(AppConst.defaultPadding),
                child: Text(
                  "الحسابات الاجتماعية",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              InkWell(
                onTap: () => openURL('http://www.instagram.com/'),
                child: CustomTile(
                  title: "انستجرام",
                  icon: FontAwesomeIcons.instagram,
                ),
              ),
              const Divider(
                height: 0,
                thickness: 2,
              ),
              InkWell(
                onTap: () => openURL('http://www.twitter.com/'),
                child: CustomTile(
                  title: "تويتر",
                  icon: FontAwesomeIcons.twitter,
                ),
              ),

              //********** */

              Padding(
                padding: const EdgeInsets.all(AppConst.defaultPadding),
                child: Text(
                  "الصفحات التعريفية",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),

              InkWell(
                onTap: () => Navigator.pushNamed(context, "/privacy"),
                child: CustomTile(
                  title: "سياسة الخصوصية",
                  icon: null,
                ),
              ),
              const Divider(
                height: 0,
                thickness: 2,
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, "/support"),
                child: CustomTile(
                  title: "سياسة الدعم",
                  icon: null,
                ),
              ),

              //********** */

              Padding(
                padding: const EdgeInsets.all(AppConst.defaultPadding),
                child: Text(
                  "التوثيق",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),

              CustomTile(
                title: "الشهادة الضريبية [154641654]",
                icon: FontAwesomeIcons.clipboard,
              ),
              const SizedBox(
                height: 7,
              ),
              CustomTile(
                title: "قيم التطبيق",
                icon: FontAwesomeIcons.star,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
