import 'dart:ui';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_toolbox/flutter_toolbox.dart';
import 'package:flutter_toolbox/generated/l10n.dart' as toolbox;
import 'package:provider/provider.dart';
import 'package:rzq_customer/generated/l10n.dart' as l10n;
import 'package:rzq_customer/providers/app_settings.dart';
import 'package:rzq_customer/providers/authentication_provider.dart';
import 'package:rzq_customer/providers/bottom_bar_provider.dart';
import 'package:rzq_customer/providers/brands_provider.dart';
import 'package:rzq_customer/providers/cart_provider.dart';
import 'package:rzq_customer/providers/categories_provider.dart';
import 'package:rzq_customer/providers/locale_provider.dart';
import 'package:rzq_customer/providers/product_profile.dart';
import 'package:rzq_customer/providers/products_provider.dart';
import 'package:rzq_customer/providers/profile_provider.dart';
import 'package:rzq_customer/screens/auth/complete_info.dart';
import 'package:rzq_customer/screens/auth/login_screen.dart';
import 'package:rzq_customer/screens/auth/verification_screen.dart';
import 'package:rzq_customer/screens/cart/cart_screen.dart';
import 'package:rzq_customer/screens/category/category_screen.dart';
import 'package:rzq_customer/screens/edit_profile/edit_profile_screen.dart';
import 'package:rzq_customer/screens/home/home_screen.dart';
import 'package:rzq_customer/screens/navigation_screen.dart';
import 'package:rzq_customer/screens/notifications/notifications_screen.dart';
import 'package:rzq_customer/screens/privacy_screen.dart';
import 'package:rzq_customer/screens/profile/profile_screen.dart';
import 'package:rzq_customer/screens/splash/splash_screen.dart';
import 'package:rzq_customer/screens/support_screen.dart';

const appName = 'rzq_sample';

//Dev
class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomBarProvider()),
        ChangeNotifierProvider(create: (_) => AppSettingsProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesProvier()),
        ChangeNotifierProvider(create: (_) => BrandsProvider()),
        ChangeNotifierProxyProvider<AuthenticationProvider, ProfileProvider>(
          update: (ctx, auth, previousProducts) =>
              ProfileProvider(token: 'Bearer ' + auth.user.token!),
          create: (x) => ProfileProvider(token: "token"),
        ),
      ],
      child: ToolboxApp(
        toolboxConfig: ToolboxConfig(
          useWeservResizer: true,
        ),
        child: Consumer<LocaleProvider>(
          builder: (context, value, child) {
            return MaterialApp(
              
              title: appName,
              debugShowCheckedModeBanner: false,
              darkTheme: ThemeData(platform: TargetPlatform.iOS),
              theme: ThemeData(
                platform: TargetPlatform.iOS,
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color(0xFF9345F9)))),
                primaryColor: const Color(0xFF9345F9),
                colorScheme: ColorScheme.light(secondary: Color(0xFF29CCC8)),
                backgroundColor: const Color(0xFFF5F8FE),
                primaryTextTheme:
                    TextTheme(headline6: TextStyle(color: Colors.black)),
                textTheme: TextTheme(
                  bodyText1: const TextStyle(color: Colors.black),
                  bodyText2:const TextStyle(color: Colors.black),
                  headline1:const TextStyle(color: Colors.black),
                  headline2: const TextStyle(color: Colors.black),
                  headline3:const TextStyle(color: Colors.black),
                  headline4:const TextStyle(color: Colors.black),
                  headline5:const TextStyle(color: Colors.black),
                  headline6:const TextStyle(color: Colors.black),
                  button:const TextStyle(color:  Color(0xFF29CCC8)),
                ),
                fontFamily: 'Droid',
                tabBarTheme: TabBarTheme(
                    indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35))),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                    color: const Color(0xFFF5F8FE),
                    elevation: 2,
                    centerTitle: true,
                    systemOverlayStyle: SystemUiOverlayStyle.dark,
                    actionsIconTheme: IconThemeData(color: Colors.black),
                    iconTheme: IconThemeData(color: Colors.black),
                    titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: "Droid",
                        fontSize: 20,
                        fontWeight: FontWeight.w900)),
              ),
              home: FutureBuilder(
                  future: Provider.of<AuthenticationProvider>(context,
                          listen: false)
                      .getCachedUser(),
                  builder: (ctx, AsyncSnapshot snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? SplashScreen()
                          : NavigationScreen()),

              //  SplashScreen(),

              onUnknownRoute: (RouteSettings settings) {
                return MaterialPageRoute<void>(
                    settings: settings,
                    builder: (BuildContext context) =>
                        Scaffold(body: Center(child: Text('Not Found'))));
              },
              routes: {
                HomeScreen.nav: (ctx) => HomeScreen(),
                NavigationScreen.nav: (ctx) => NavigationScreen(),
                NotificationsScreen.nav: (ctx) => NotificationsScreen(),
                CartScreen.nav: (ctx) => CartScreen(),
                CategoryScreen.nav: (ctx) => CategoryScreen(),
                ProfileScreen.nav: (ctx) => ProfileScreen(),
                LoginScreen.nav: (ctx) => LoginScreen(),
                CompleteInfo.nv: (ctx) => CompleteInfo(),
                VerificationScreen.nv: (ctx) => VerificationScreen(),
                EditProfileScreen.nav: (ctx) => EditProfileScreen(),
                PrivacyScreen.nv: (ctx) => PrivacyScreen(),
                SupportScreen.nv: (ctx) => SupportScreen(),
              },
              localizationsDelegates: const [
                l10n.S.delegate,
                toolbox.S.delegate,
                CountryLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const <Locale>[
                Locale('en'),
                Locale('ar'),
              ],
              locale: value.getLocale(),
            );
          },
        ),
      ),
    );
  }
}
