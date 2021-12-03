// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_country_picker/country.dart';
// import 'package:flutter_toolbox/flutter_toolbox.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;

// class PhoneVerification extends StatefulWidget {
//   PhoneVerification({
//     @required this.countryCode,
//     @required this.phoneNumber,
//     this.onVerificationFailure,
//     this.onVerificationSuccess,
//   });

//   final Country countryCode;
//   final String phoneNumber;

//   final VoidCallback onVerificationFailure;
//   final Function(String phone) onVerificationSuccess;

//   @override
//   PhoneVerificationState createState() => PhoneVerificationState();
// }

// class PhoneVerificationState extends State<PhoneVerification> {
//   final formKey = GlobalKey<FormState>();
//   int showStatus = 1;
//   String _errorMessage = '';

//   bool isSmsCodeSent = false;
//   bool isError = false;

//   String _optText = "";
//   String _verificationId;

//   bool _loading = false;

//   TextEditingController textEditingController = TextEditingController();

//   StreamController<ErrorAnimationType> errorController;

//   Timer timer;
//   int _start = 60;

//   String currentText;

//   Future onVerificationSuccess() async {
//     setState(() => _loading = true);
//     final phone =
//         // getValidNumber(widget.countryCode.dialingCode, widget.phoneNumber);

//     // await widget.onVerificationSuccess(phone);
//     setState(() => _loading = false);
//   }

//   Future createUser(AuthCredential credential) async {
//     final onError = (exception, stacktrace) {
//       d('Error from _signIn: $exception');
//       setState(() => showStatus = 4);
//     };

//     final User user =
//         (await _auth.signInWithCredential(credential).catchError(onError))
//             ?.user;

//     if (user != null) {
//       final User currentUser = _auth.currentUser;
//       assert(user.uid == currentUser.uid);
//       onVerificationSuccess();
//     } else {
//       setState(() => showStatus = 4);
//     }
//   }

//   Future<void> verifyPhone() async {
//     final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
//         (String verId) {
//       d("autoRetrieve => verId = $verId");
//       _verificationId = verId;
//       setState(() => showStatus = 3);
//     };

//     final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeSent]) {
//       d("smsCodeSent => verId = $verId");
//       _verificationId = verId;
//       setState(() {
//         showStatus = 2;
//         startTimer();
//       });
//     };

//     final PhoneVerificationCompleted autoVerifiedSuccess =
//         (AuthCredential phoneAuthCredential) async {
//       d("autoVerifiedSuccess => phoneAuthCredential $phoneAuthCredential");

//       await createUser(phoneAuthCredential);
//       Future.delayed(Duration(seconds: 2), onVerificationSuccess);
//     };

//     final PhoneVerificationFailed verifyFailed =
//         (FirebaseAuthException exception) {
//       d("Failed ${exception.message}");

//       setState(() {
//         showStatus = 5;
//         _errorMessage = localizeErrorMessage(context, exception);
//       });
//     };

//     // d("getValidNumber(widget.countryCode.dialingCode, widget.phoneNumber) = ${getValidNumber(widget.countryCode.dialingCode, widget.phoneNumber)}");
//     // await _auth.verifyPhoneNumber(
//     //   phoneNumber:
//     //       getValidNumber(widget.countryCode.dialingCode, widget.phoneNumber),
//     //   timeout: const Duration(seconds: 5),
//     //   verificationCompleted: autoVerifiedSuccess,
//     //   verificationFailed: verifyFailed,
//     //   codeSent: smsCodeSent,
//     //   codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
//     // );

//     d(_verificationId);
//   }

//   Future manualVerification() async {
//     final AuthCredential credential = PhoneAuthProvider.credential(
//       verificationId: _verificationId,
//       smsCode: _optText,
//     );

//     await createUser(credential);
//   }

//   void startTimer() {
//     const oneSec = const Duration(seconds: 1);
//     timer = new Timer.periodic(
//       oneSec,
//       (Timer timer) => setState(
//         () {
//           if (_start < 1) {
//             timer.cancel();
//             showStatus = 6;
//           } else {
//             _start = _start - 1;
//           }
//         },
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() async => startTimer());
//     errorController = StreamController<ErrorAnimationType>();
//     verifyPhone();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     timer.cancel();
//     errorController.close();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // leading: backButton(context),
//         centerTitle: true,
//         title: Text(
//           "S.of(context).confirmLogin",
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
//                 confirmLoginform(),
//                 // buttumButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Expanded confirmLoginform() {
//     return Expanded(
//       child: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Center(
//               child: Text(
//                 "S.of(context).confirmLoginDesc",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 15, color: Colors.black),
//               ),
//             ),
//           ),
//           Center(
//             child: Text(
//               "${widget.countryCode.dialingCode}${widget.phoneNumber}+",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 15, color: Colors.black),
//             ),
//           ),
//           Center(child: codeStatus()),
//           SizedBox(height: 24),
//           Center(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white30,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text("00:${_start.toString()}"),
//               ),
//             ),
//           ),
//           SizedBox(height: 24),
//           buildCodeInput(),
//           SizedBox(height: 50),
//           // Padding(
//           //   padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
//           //   child: CommonButton(
//           //     text: S.of(context).requestANewOTP,
//           //     textSize: 16,
//           //     circler: 20,
//           //     backcolor: Color(0xffF7F7F7),
//           //     textColor: Colors.black,
//           //     onTap: () async {
//           //       await verifyPhone();
//           //     },
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }

//   // Padding buttumButton() {
//   //   return Padding(
//   //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//   //     child: CommonButton(
//   //       text: S.of(context).signIN,
//   //       textSize: 16,
//   //       useGradient: true,
//   //       circler: 12,
//   //       textColor: Colors.white,
//   //       onTap: matchOtp,
//   //     ),
//   //   );
//   // }

//   Widget buildCodeInput() {
//     return PinCodeTextField(
//       length: 6,
//       obscureText: false,
//       enablePinAutofill: true,
//       animationType: AnimationType.fade,
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       keyboardType: TextInputType.number,
//       pinTheme: PinTheme(
//         shape: PinCodeFieldShape.box,
//         borderRadius: BorderRadius.circular(12),
//         fieldHeight: 50,
//         fieldWidth: 50,
//         activeFillColor: Color(0xffC3C3C5),
//         disabledColor: Color(0xffF7F7F7),
//         inactiveColor: Color(0xffF7F7F7),
//         selectedColor: Colors.white,
//         inactiveFillColor: Color(0xffF7F7F7),
//         selectedFillColor: Color(0xffF7F7F7),
//         activeColor: Color(0xffC3C3C5),
//       ),
//       cursorColor: Colors.black,
//       textStyle: TextStyle(fontSize: 25, height: 1.6, color: Colors.black),
//       animationDuration: Duration(milliseconds: 300),
//       enableActiveFill: true,
//       errorAnimationController: errorController,
//       controller: textEditingController,
//       onCompleted: (v) {},
//       onChanged: (value) {
//         setState(() {
//           currentText = value;
//         });
//       },
//       onSaved: (val) => _optText = val,
//       beforeTextPaste: (text) {
//         return true;
//       },
//       appContext: context,
//     );
//   }

//   Future matchOtp() async {
//     final FormState form = formKey.currentState;
//     if (form.validate()) {
//       form.save();
//       d("Entered OTP is $_optText");
//       if (_optText.length < 6) return;

//       await manualVerification();
//     }
//   }

//   Widget codeStatus() {
//     if (showStatus == 1) {
//       return Text(
//         "S.of(context).inProgressMessage",
//         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//       );
//     }
//     if (showStatus == 2) {
//       return Text(
//         "S.of(context).messageSent",
//         style: TextStyle(
//             fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
//       );
//     }
//     if (showStatus == 3) {
//       return CircularProgressIndicator();
//     }
//     if (showStatus == 4) {
//       return Text(
//         "S.of(context).wrongCode",
//         style: TextStyle(
//             fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
//       );
//     }
//     if (showStatus == 5) {
//       return Text(
//         _errorMessage,
//         style: TextStyle(
//             fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
//       );
//     }
//     if (showStatus == 6) {
//       return Text(
//         "S.of(context).timeover",
//         style: TextStyle(
//             fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
//       );
//     }
//     return Container();
//   }
// }

// String localizeErrorMessage(
//     BuildContext context, FirebaseAuthException exception) {
//   final localizedErrorMessages = {
//     "invalidCredential": 'الرقم الذي أدخلته غير صحيح',
//     "tooManyRequests":
//         'تم حجب رقمك مأقتا بسبب المحاولات المتكررة. الرجاء المحاولة مرة أخري خلال 4 ساعات.'
//   };

//   d("localizedErrorMessages.containsKey(exception.code) = ${localizedErrorMessages.containsKey(exception.code)}");
//   d("exception.code = ${exception.code}");

//   return localizedErrorMessages.containsKey(exception.code)
//       ? localizedErrorMessages[exception.code]
//       : exception.message;
// }
