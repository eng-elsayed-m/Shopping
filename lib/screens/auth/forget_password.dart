// import 'package:flutter/material.dart';
// import 'package:flutter_country_picker/country.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_toolbox/flutter_toolbox.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';

// class ForgetPasswordScreen extends StatefulWidget {
//   @override
//   ForgetPasswordScreenState createState() => ForgetPasswordScreenState();
// }

// class ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
//   final formKey = GlobalKey<FormState>();
//   String phoneNumber;

//   bool _loading = false;

//   Country _countryCode = Country.SA;

//   Future _forgetPasswor() async {
//     final FormState form = formKey.currentState;
//     if (form.validate()) {
//       form.save();
//       await safeRequest(
//         api().resetPassword("${_countryCode.dialingCode}$phoneNumber"),
//         onSuccess: (ResetPassResponse result) {
//           print(result);
//           if (result.code == '200') {
//             push(context, ResetPassswordScreen(phoneNumber, _countryCode));
//           } else {
//             errorToast(S.of(context).invalidNumber);
//           }
//         },
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: backButton(context),
//         centerTitle: true,
//         title: Text(
//           S.of(context).didYouForgetPassword,
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 17,
//           ),
//         ),
//       ),
//       body: ModalProgressHUD(
//         inAsyncCall: _loading,
//         child: Form(
//           key: formKey,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 forgetPasswordForm(),
//                 buttomButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Expanded forgetPasswordForm() {
//     return Expanded(
//       child: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               S.of(context).forgetPasswordDesc,
//               style: TextStyle(color: Colors.black, fontSize: 15),
//             ),
//           ),
//           mobileNumber(),
//         ],
//       ),
//     );
//   }

//   Padding buttomButton() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: CommonButton(
//         text: S.of(context).RequestOTP,
//         textSize: 16,
//         textColor: Colors.white,
//         circler: 12,
//         useGradient: true,
//         onTap: () async {
//           setState(() => _loading = true);
//           await _forgetPasswor();
//           setState(() => _loading = false);
//         },
//       ),
//     );
//   }

//   Stack mobileNumber() {
//     return Stack(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: CommonTextField(
//             prefixIcon: Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: SvgPicture.asset(
//                 R.mobile,
//                 fit: BoxFit.none,
//               ),
//             ),
//             hint: S.of(context).PhoneNumber,
//             fillColor: Color(0xffF7F7F7),
//             border: OutlineInputBorder(
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(12.0),
//                 ),
//                 borderSide: BorderSide.none),
//             onSaved: (val) => phoneNumber = val,
//             validator: (val) => Validation().checkphoneNumber(val, context),
//           ),
//         ),
//         Positioned(
//           left: LanguageCheck().getLanguageCode(context) == 'ar' ? 30 : null,
//           right: LanguageCheck().getLanguageCode(context) == 'en' ? 30 : null,
//           top: 10,
//           child: Container(
//             height: 52,
//             padding: EdgeInsets.all(4),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: appGradient.colors,
//               ),
//               borderRadius: BorderRadius.only(
//                 //for english language
//                 topRight: LanguageCheck().getLanguageCode(context) == 'en' ? Radius.circular(12.0) : Radius.zero,
//                 bottomRight: LanguageCheck().getLanguageCode(context) == 'en' ? Radius.circular(12.0) : Radius.zero,
//                 //for arabic language
//                 topLeft: LanguageCheck().getLanguageCode(context) == 'ar' ? Radius.circular(12.0) : Radius.zero,
//                 bottomLeft: LanguageCheck().getLanguageCode(context) == 'ar' ? Radius.circular(12.0) : Radius.zero,
//               ),
//             ),
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
