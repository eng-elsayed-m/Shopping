// import 'package:flutter/material.dart';
// import 'package:flutter_country_picker/country.dart';
// import 'package:flutter_country_picker/flutter_country_picker.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_toolbox/flutter_toolbox.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:oktoast/oktoast.dart';
// // import 'package:rzq_customer/providers/auth_provider.dart';
// import 'package:rzq_customer/screens/home/home.dart';
// import 'package:rzq_customer/styles/colors.dart';

// class SignInScreen extends StatefulWidget {
//   static const nav = "/signin";
//   @override
//   SignInScreenState createState() => SignInScreenState();
// }

// class SignInScreenState extends State<SignInScreen> {
//   final formKey = GlobalKey<FormState>();
//   String phoneNumber;
//   String password;

//   bool _loading = false;

//   Country _countryCode = Country.SA;

//   // Future _login() async {
//   //   final FormState form = formKey.currentState;
//   //   if (form.validate()) {
//   //     form.save();
//   //     await AuthProvider.of(context, listen: false).login(
//   //       context,
//   //       "${_countryCode.dialingCode}$phoneNumber",
//   //       password,
//   //       () async {
//   //         pushAndRemoveUntil(context, HomeScreen(), null);
//   //       },
//   //       checkProviderOrUser: (user) {
//   //         bool isProvider = user?.success?.user?.groups
//   //                 ?.map((group) => group.slug)
//   //                 ?.contains('provider') ==
//   //             true;
//   //         if (isProvider) {
//   //           showToast(
//   //             S.of(context).User_use,
//   //             duration: LONG_DURATION,
//   //             backgroundColor: Colors.white,
//   //             textAlign: TextAlign.center,
//   //             textPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//   //             textStyle: TextStyle(color: Color(0xffD63857), fontSize: 15),
//   //           );
//   //           return true;
//   //         }
//   //         return false;
//   //       },
//   //       showServerErrorMessage: false,
//   //       onError: (ErrorResponse response) {
//   //         final error = response.error;
//   //         if (error == 'Unauthorized access' || error == 'Unauthorized')
//   //           showToast(
//   //             S.of(context).notRegistered,
//   //             duration: LONG_DURATION,
//   //             backgroundColor: Colors.white,
//   //             textAlign: TextAlign.center,
//   //             textPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//   //             textStyle: TextStyle(color: Color(0xffD63857), fontSize: 15),
//   //           );
//   //         else
//   //           errorToast(error);
//   //       },
//   //     );
//   //   }
//   // }

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
//                   height: screenSize.height * 0.78,
//                   child: ListView(
//                     shrinkWrap: true,
//                     children: [
//                       header(),
//                       formFialds(),
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

//   // Container logo() {
//   //   return Container(
//   //     child: Center(
//   //       child: Image.asset(
//   //         R.logo,
//   //         fit: BoxFit.contain,
//   //         height: 50,
//   //       ),
//   //     ),
//   //   );
//   // }

//   Container header() {
//     final screenSize = MediaQuery.of(context).size;

//     return Container(
//       width: screenSize.width,
//       padding: EdgeInsets.all(8),
//       child: Stack(
//         children: [
//           Positioned(
//               top: -40,
//               child: CircleAvatar(
//                 backgroundColor: Colors.black45,
//                 radius: 30,
//               )
//               // SvgPicture.asset(
//               //   R.maskLogo,
//               //   fit: BoxFit.cover,
//               // ),
//               ),
//           Center(
//             heightFactor: 2,
//             child: Text("Rzq"),
//           ),
//         ],
//       ),
//     );
//   }

//   Column formFialds() {
//     return Column(
//       children: [
//         mobileNumber(),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Color(0xffF7F7F7),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               children: [
//                 TextField(
//                   decoration: InputDecoration(
//                     prefixIcon: Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: Icon(Icons.lock)),
//                     hintText: "Password",
//                     fillColor: Color(0xffF7F7F7),
//                     border: OutlineInputBorder(
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(12.0),
//                         ),
//                         borderSide: BorderSide.none),
//                   ),
//                   obscureText: true,
//                   onSubmitted: (val) => password = val,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: InkWellStacked(
//                     onTap: () {},
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(12),
//                             bottomRight: Radius.circular(12)),
//                       ),
//                       width: 10000,
//                       height: 30,
//                       child: Center(
//                         child: Text(
//                           "ForgetPassword",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 13,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         // Padding(
//         //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//         //   child: CommonButton(
//         //     text: S.of(context).signIN,
//         //     textSize: 16,
//         //     useGradient: true,
//         //     circler: 12,
//         //     textColor: Colors.white,
//         //     onTap: (){}
//         //     //  async {
//         //     //   setState(() => _loading = true);
//         //     //   await _login();
//         //     //   setState(() => _loading = false);
//         //     // },
//         //   ),
//         // ),
//       ],
//     );
//   }

//   // Column buttom() {
//   //   return Column(
//   //     children: [
//   //       Text(
//   //         S.of(context).or,
//   //         style: TextStyle(
//   //           fontSize: 15,
//   //         ),
//   //       ),
//   //       // SizedBox(height: 12),
//   //       // Padding(
//   //       //   padding: const EdgeInsets.symmetric(
//   //       //     horizontal: 24,
//   //       //   ),
//   //       //   child: CommonButton(
//   //       //     text: S.of(context).createAccount,
//   //       //     textSize: 16,
//   //       //     backcolor: Color(0xffF7F7F7),
//   //       //     onTap: () => push(context, SignUPScreen()),
//   //       //   ),
//   //       // ),
//   //       SizedBox(height: 12),
//   //       Padding(
//   //         padding: const EdgeInsets.symmetric(
//   //           horizontal: 24,
//   //         ),
//   //         child: CommonButton(
//   //           text: S.of(context).browseApp,
//   //           textSize: 16,
//   //           backcolor: Color(0xffF7F7F7),
//   //           onTap: () => pushAndRemoveUntil(context, HomeScreen(), null),
//   //         ),
//   //       ),
//   //       SizedBox(height: 24),
//   //     ],
//   //   );
//   // }

//   Stack mobileNumber() {
//     return Stack(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: TextField(
//             decoration: InputDecoration(
//               prefixIcon: Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Icon(Icons.phone_iphone_rounded)),
//               hintText: "11 234 567",
//               fillColor: Color(0xffF7F7F7),
//               border: OutlineInputBorder(
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(12.0),
//                   ),
//                   borderSide: BorderSide.none),
//             ),
//             onSubmitted: (val) => phoneNumber = val,
//             // validator: (val) => Validation().checkphoneNumber(val, context),
//           ),
//         ),
//         Positioned(
//           // left: LanguageCheck().getLanguageCode(context) == 'ar' ? 20 : null,
//           // right: LanguageCheck().getLanguageCode(context) == 'en' ? 20 : null,
//           left: 20,
//           top: 10,
//           child: Container(
//             height: 52,
//             padding: EdgeInsets.all(4),
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: AppColors.appGradient.colors,
//                 ),
//                 borderRadius: BorderRadius.circular(12)

//                 //  BorderRadius.only(
//                 //   //for english language
//                 //   topRight: LanguageCheck().getLanguageCode(context) == 'en'
//                 //       ? Radius.circular(12.0)
//                 //       : Radius.zero,
//                 //   bottomRight: LanguageCheck().getLanguageCode(context) == 'en'
//                 //       ? Radius.circular(12.0)
//                 //       : Radius.zero,
//                 //   //for arabic language
//                 //   topLeft: LanguageCheck().getLanguageCode(context) == 'ar'
//                 //       ? Radius.circular(12.0)
//                 //       : Radius.zero,
//                 //   bottomLeft: LanguageCheck().getLanguageCode(context) == 'ar'
//                 //       ? Radius.circular(12.0)
//                 //       : Radius.zero,
//                 // ),
//                 ),
//             child: CountryPicker(
//               showDialingCode: true,
//               dialingCodeTextStyle: TextStyle(
//                 color: Colors.white,
//                 fontFamily: 'helvetica',
//                 fontSize: 17,
//               ),
//               showName: false,
//               showFlag: false,
//               onChanged: (Country country) {
//                 setState(() => _countryCode = country);
//               },
//               selectedCountry: _countryCode,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
