// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_toolbox/flutter_toolbox.dart';
// import 'package:rzq_customer/providers/locale_provider.dart';
// import 'package:rzq_customer/screens/auth/sign_in.dart';
// import 'package:rzq_customer/styles/colors.dart';

// class ChooseLanguageScreen extends StatefulWidget {
//   @override
//   ChooseLanguageScreenState createState() => ChooseLanguageScreenState();
// }

// class ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: appGradient.colors,
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//           ),
//           image: DecorationImage(
//             image: AssetImage(R.logoMasked),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Stack(
//           children: [
//             Center(child: logo()),
//             chooseLanguage(),
//           ],
//         ),
//       ),
//     );
//   }

//   Padding chooseLanguage() {
//     final screenSize = MediaQuery.of(context).size;
//     final localeProvider = LocaleProvider.of(context);

//     return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SvgPicture.asset(
//             R.translate,
//             color: Colors.white,
//           ),
//           SizedBox(height: 24),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 height: 50,
//                 width: screenSize.width / 3.5,
//                 child: CommonButton(
//                   text: S.of(context).arabic,
//                   textSize: 17,
//                   textColor: Colors.white,
//                   backcolor: Color(0xffE8726D),
//                   onTap: () {
//                     if (localeProvider.getLocale().languageCode != 'ar') {
//                       localeProvider.saveLocale(Locale('ar'));
//                     }
//                     push(context, SignInScreen());
//                   },
//                 ),
//               ),
//               Container(
//                 height: 50,
//                 width: screenSize.width / 3.5,
//                 child: CommonButton(
//                   text: S.of(context).english,
//                   textSize: 17,
//                   textColor: Colors.white,
//                   backcolor: Color(0xffE8726D),
//                   onTap: () {
//                     if (localeProvider.getLocale().languageCode != 'en') {
//                       localeProvider.saveLocale(Locale('en'));
//                     }
//                     push(context, SignInScreen());
//                   },
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget logo() {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(R.logoMasked),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Center(
//         child: Image.asset(
//           R.newLogoWhite,
//           height: 140,
//         ),
//       ),
//     );
//   }
// }
