// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_country_picker/country.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_toolbox/flutter_toolbox.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:rzq_customer/providers/auth_provider.dart';
// import 'package:rzq_customer/screens/home/home.dart';
//
// class SignUPScreen extends StatefulWidget {
//   @override
//   SignUPScreenState createState() => SignUPScreenState();
// }
//
// class SignUPScreenState extends State<SignUPScreen> {
//   final formKey = GlobalKey<FormState>();
//   String phoneNumber;
//   String password;
//   String email;
//   String name;
//
//   bool _loading = false;
//
//   Country _countryCode = Country.SA;
//
//   Future register() async {
//     final FormState form = formKey.currentState;
//     if (form.validate()) {
//       form.save();
//       await AuthProvider.of(context, listen: false).register(
//         context,
//         "${_countryCode.dialingCode}$phoneNumber",
//         "${_countryCode.dialingCode}$phoneNumber",
//         email,
//         password,
//         password,
//         () => pushAndRemoveUntil(context, HomeScreen(), null),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       body: ModalProgressHUD(
//         inAsyncCall: _loading,
//         child: Form(
//           key: formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   height: screenSize.height * 0.81,
//                   child: ListView(
//                     shrinkWrap: true,
//                     children: [
//                       header(),
//                       // formFialds(),
//                     ],
//                   ),
//                 ),
//                 // buttom(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Container logo() {
//     return Container(
//       child: Center(
//         child: Image.asset(
//           "R.logo",
//           fit: BoxFit.contain,
//           height: 50,
//         ),
//       ),
//     );
//   }
//
//   Container header() {
//     final screenSize = MediaQuery.of(context).size;
//
//     return Container(
//       width: screenSize.width,
//       padding: EdgeInsets.all(8),
//       child: Stack(
//         children: [
//           Positioned(
//             top: -40,
//             child: SvgPicture.asset(
//               "R.maskLogo",
//               fit: BoxFit.cover,
//             ),
//           ),
//           Center(
//             heightFactor: 2,
//             child: logo(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Column formFialds() {
//   //   return Column(
//   //     children: [
//   //       mobileNumber(),
//   //       // Padding(
//   //       //   padding: const EdgeInsets.symmetric(horizontal: 16),
//   //       //   child: CommonTextField(
//   //       //     prefixIcon: Padding(
//   //       //       padding: const EdgeInsets.all(4.0),
//   //       //       child: SvgPicture.asset(
//   //       //         R.mail,
//   //       //         fit: BoxFit.none,
//   //       //       ),
//   //       //     ),
//   //       //     hint: S.of(context).email,
//   //       //     fillColor: Color(0xffF7F7F7),
//   //       //     border: OutlineInputBorder(
//   //       //         borderRadius: const BorderRadius.all(
//   //       //           Radius.circular(12.0),
//   //       //         ),
//   //       //         borderSide: BorderSide.none),
//   //       //     onSaved: (val) => email = val,
//   //       //     validator: (val) => Validation().checkEmail(val, context),
//   //       //   ),
//   //       // ),
//   //       Padding(
//   //         padding: const EdgeInsets.symmetric(horizontal: 20),
//   //         child: CommonTextField(
//   //           prefixIcon: Padding(
//   //             padding: const EdgeInsets.all(4.0),
//   //             child: SvgPicture.asset(
//   //               R.password,
//   //               fit: BoxFit.none,
//   //             ),
//   //           ),
//   //           hint: S.of(context).password,
//   //           fillColor: Color(0xffF7F7F7),
//   //           border: OutlineInputBorder(
//   //               borderRadius: const BorderRadius.all(
//   //                 Radius.circular(12.0),
//   //               ),
//   //               borderSide: BorderSide.none),
//   //           obscureText: true,
//   //           onSaved: (val) => password = val,
//   //           validator: (value) {
//   //             if (value.length < 9) {
//   //               return S.of(context).passwordIsTooShort;
//   //             } else {
//   //               return null;
//   //             }
//   //           },
//   //         ),
//   //       ),
//   //       Padding(
//   //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//   //         child: CommonButton(
//   //           text: S.of(context).signUp,
//   //           textSize: 16,
//   //           useGradient: true,
//   //           circler: 12,
//   //           textColor: Colors.white,
//   //           onTap: () async {
//   //             final FormState form = formKey.currentState;
//   //             if (form.validate()) {
//   //               form.save();
//   //
//   //               push(
//   //                 context,
//   //                 PhoneVerification(
//   //                   phoneNumber: phoneNumber,
//   //                   countryCode: _countryCode,
//   //                   onVerificationSuccess: (String phone) async {
//   //                     setState(() => _loading = true);
//   //                     await register();
//   //                     setState(() => _loading = false);
//   //                   },
//   //                 ),
//   //               );
//   //             }
//   //           },
//   //         ),
//   //       ),
//   //     ],
//   //   );
//   // }
//
//   // Column buttom() {
//   //   return Column(
//   //     children: [
//   //       Text(
//   //         S.of(context).or,
//   //         style: TextStyle(
//   //           fontSize: 15,
//   //         ),
//   //       ),
//   //       SizedBox(height: 8),
//   //       Padding(
//   //         padding: const EdgeInsets.symmetric(
//   //           horizontal: 24,
//   //         ),
//   //         child: CommonButton(
//   //           text: S.of(context).login,
//   //           textSize: 16,
//   //           backcolor: Color(0xffF7F7F7),
//   //           onTap: () => push(context, SginINScreen()),
//   //         ),
//   //       ),
//   //       SizedBox(height: 8),
//   //       Padding(
//   //         padding: const EdgeInsets.symmetric(
//   //           horizontal: 24,
//   //         ),
//   //         child: CommonButton(
//   //           text: S.of(context).browseApp,
//   //           textSize: 16,
//   //           backcolor: Color(0xffF7F7F7),
//   //           onTap: () => pushAndRemoveUntil(context, HomePage(), null),
//   //         ),
//   //       ),
//   //       SizedBox(height: 8),
//   //     ],
//   //   );
//   // }
//   //
//   // Stack mobileNumber() {
//   //   return Stack(
//   //     children: <Widget>[
//   //       Padding(
//   //         padding: const EdgeInsets.symmetric(horizontal: 16),
//   //         child: CommonTextField(
//   //           prefixIcon: Padding(
//   //             padding: const EdgeInsets.all(4.0),
//   //             child: SvgPicture.asset(
//   //               R.mobile,
//   //               fit: BoxFit.none,
//   //             ),
//   //           ),
//   //           hint: S.of(context).PhoneNumber,
//   //           fillColor: Color(0xffF7F7F7),
//   //           border: OutlineInputBorder(
//   //               borderRadius: const BorderRadius.all(
//   //                 Radius.circular(12.0),
//   //               ),
//   //               borderSide: BorderSide.none),
//   //           onSaved: (val) => phoneNumber = val,
//   //           validator: (val) => Validation().checkphoneNumber(val, context),
//   //         ),
//   //       ),
//   //       Positioned(
//   //         left: LanguageCheck().getLanguageCode(context) == 'ar' ? 20 : null,
//   //         right: LanguageCheck().getLanguageCode(context) == 'en' ? 20 : null,
//   //         top: 10,
//   //         child: Container(
//   //           height: 52,
//   //           padding: EdgeInsets.all(4),
//   //           decoration: BoxDecoration(
//   //             gradient: LinearGradient(
//   //               colors: appGradient.colors,
//   //             ),
//   //             borderRadius: BorderRadius.only(
//   //               //for english language
//   //               topRight: LanguageCheck().getLanguageCode(context) == 'en'
//   //                   ? Radius.circular(12.0)
//   //                   : Radius.zero,
//   //               bottomRight: LanguageCheck().getLanguageCode(context) == 'en'
//   //                   ? Radius.circular(12.0)
//   //                   : Radius.zero,
//   //               //for arabic language
//   //               topLeft: LanguageCheck().getLanguageCode(context) == 'ar'
//   //                   ? Radius.circular(12.0)
//   //                   : Radius.zero,
//   //               bottomLeft: LanguageCheck().getLanguageCode(context) == 'ar'
//   //                   ? Radius.circular(12.0)
//   //                   : Radius.zero,
//   //             ),
//   //           ),
//   //           child: CountryPicker(
//   //             showDialingCode: true,
//   //             dialingCodeTextStyle: TextStyle(
//   //               color: Colors.white,
//   //               fontFamily: 'helvetica',
//   //               fontSize: 17,
//   //             ),
//   //             showName: false,
//   //             showFlag: false,
//   //             onChanged: (Country country) {
//   //               setState(() => _countryCode = country);
//   //             },
//   //             selectedCountry: _countryCode,
//   //           ),
//   //         ),
//   //       ),
//   //     ],
//   //   );
//   // }
// }
