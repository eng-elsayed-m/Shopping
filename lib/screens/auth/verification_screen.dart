import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:rzq_customer/model/api/api_response.dart';
import 'package:rzq_customer/providers/authentication_provider.dart';

class VerificationScreen extends StatefulWidget {
  static const nv = "/verification";
  VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String vCode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("رمز التحقق"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<AuthenticationProvider>(
          builder: (context, _auth, child) => SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Icon(Icons.verified_user_sharp,
                      size: 160,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                Text("برجاء ادخال الكود المرسل الى "),
                Text(_auth.user.email ?? _auth.user.phone!),
                _auth.response.status == Status.ERROR
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _auth.response.message!,
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    : Text("سيصلك رمز التحقق خلال دقائق"),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: _auth.response.status == Status.LOADING
                      ? LinearProgressIndicator(
                          minHeight: 20,
                        )
                      : Directionality(
                          textDirection: TextDirection.ltr,
                          child: PinCodeTextField(
                            appContext: context,
                            onChanged: (v) => vCode = v,
                            textInputAction: TextInputAction.done,
                            animationType: AnimationType.scale,
                            pinTheme: PinTheme.defaults(
                              activeColor: Theme.of(context).primaryColor,
                              selectedColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            length: 4,
                            keyboardType: TextInputType.number,
                            backgroundColor: Colors.transparent,
                            validator: (v) =>
                                v!.isEmpty ? "برجاء ادخال الكود" : null,
                            errorTextSpace: 35,
                          ),
                        ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                    ),
                    child: Text("تأكيد"),
                    onPressed: () async {
                      if (vCode.length < 4) return;
                      final verified = await _auth.verifyCode(vCode);
                      if (verified != null)
                        Navigator.of(context).pushReplacementNamed(
                            verified ? "/navigation" : "/complete_info");
                      vCode = "";
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
