// import 'package:flutter/material.dart';
// import 'package:flutter_country_picker/country.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_toolbox/flutter_toolbox.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:rzq_customer/screens/auth/sign_in.dart';
//
// class ResetPasswordScreen extends StatefulWidget {
//   final String phoneNumber;
//   final Country countryCode;
//
//   ResetPasswordScreen(this.phoneNumber, this.countryCode);
//
//   @override
//   ResetPasswordScreenState createState() => ResetPasswordScreenState();
// }
//
// class ResetPasswordScreenState extends State<ResetPasswordScreen> {
//   final formKey = GlobalKey<FormState>();
//   String otpCode;
//   String password;
//   String confirmPassword;
//
//   Future _resetPasswor() async {
//     final FormState form = formKey.currentState;
//     if (form.validate()) {
//       form.save();
//       await safeRequest(
//           api().smsOtp(
//             "${widget.countryCode.dialingCode}${widget.phoneNumber}",
//             otp: otpCode,
//             password: password,
//           ), onSuccess: (SmsotpResponse val) {
//         if (val.error != null) {
//           if (val.error == 'Invalid OTP') {
//             errorToast(S.of(context).codeWrong);
//           } else {
//             errorToast(val.error);
//           }
//         } else {
//           pushAndRemoveUntil(context, SignInScreen(), null);
//         }
//       });
//     }
//   }
//
//   bool _loading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: backButton(context),
//         centerTitle: true,
//         title: Text(
//           S.of(context).new_password,
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
//
//   Expanded forgetPasswordForm() {
//     return Expanded(
//       child: ListView(
//         children: [
//           RequiredTextField(
//             prefixIcon: Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: SvgPicture.asset(
//                 R.edit,
//                 fit: BoxFit.none,
//               ),
//             ),
//             hint: S.of(context).code,
//             fillColor: Color(0xffF7F7F7),
//             border: OutlineInputBorder(
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(12.0),
//                 ),
//                 borderSide: BorderSide.none),
//             onSaved: (val) => otpCode = val,
//           ),
//           SizedBox(height: 8),
//           CommonTextField(
//             prefixIcon: Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: SvgPicture.asset(
//                 R.password,
//                 fit: BoxFit.none,
//               ),
//             ),
//             hint: S.of(context).password,
//             validator: (value) {
//               if (value.length < 9) {
//                 return S.of(context).passwordIsTooShort;
//               } else {
//                 return null;
//               }
//             },
//             fillColor: Color(0xffF7F7F7),
//             border: OutlineInputBorder(
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(12.0),
//                 ),
//                 borderSide: BorderSide.none),
//             onchanged: (val) => password = val,
//             onSaved: (val) => password = val,
//           ),
//           SizedBox(height: 8),
//           CommonTextField(
//             prefixIcon: Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: SvgPicture.asset(
//                 R.password,
//                 fit: BoxFit.none,
//               ),
//             ),
//             hint: S.of(context).confirmPassword,
//             validator: (value) {
//               if (password != value) {
//                 return S.of(context).notMatch;
//               } else {
//                 return null;
//               }
//             },
//             fillColor: Color(0xffF7F7F7),
//             border: OutlineInputBorder(
//                 borderRadius: const BorderRadius.all(
//                   Radius.circular(12.0),
//                 ),
//                 borderSide: BorderSide.none),
//             onSaved: (val) => confirmPassword = val,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Padding buttomButton() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: CommonButton(
//         text: S.of(context).confirm,
//         textSize: 16,
//         textColor: Colors.white,
//         circler: 12,
//         useGradient: true,
//         onTap: () async {
//           setState(() => _loading = true);
//           await _resetPasswor();
//           setState(() => _loading = false);
//         },
//       ),
//     );
//   }
// }
