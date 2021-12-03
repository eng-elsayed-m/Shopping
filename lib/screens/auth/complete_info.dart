import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rzq_customer/model/api/api_response.dart';
import 'package:rzq_customer/providers/authentication_provider.dart';
import 'package:rzq_customer/styles/app_const.dart';

class CompleteInfo extends StatefulWidget {
  static const nv = "/complete_info";
  CompleteInfo({Key? key}) : super(key: key);

  @override
  _CompleteInfoState createState() => _CompleteInfoState();
}

class _CompleteInfoState extends State<CompleteInfo> {
  // RegExp(r'\p{L}')
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');
  static final RegExp numberRegExp = RegExp(r'\d');
  GlobalKey<FormState> _formKey = GlobalKey();
  String? firstName;
  String? lastName;
  String? phone;

  @override
  Widget build(BuildContext context) {
    final dSize = MediaQuery.of(context).size;
    return Consumer<AuthenticationProvider>(builder: (context, _auth, child) {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("التسجيل"),
          centerTitle: true,
          actions: [
            TextButton(
              child: Text("حفظ"),
              onPressed: () {
                if (_formKey.currentState!.validate())
                  _auth.register({
                    "first_name": firstName,
                    "last_name": lastName,
                    "phone": phone
                  }).then((value) {
                    if (_auth.response.status == Status.ERROR) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(_auth.response.message!),
                      ));
                    } else {
                      Navigator.popAndPushNamed(context, "/personal_profile");
                    }
                  });
              },
            )
          ],
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Container(
              width: dSize.width * 0.8,
              height: dSize.height * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                      child: Text(
                    "برجاء استكمال المعلومات التاليه",
                    textAlign: TextAlign.center,
                  )),
                  TextFormField(
                    validator: (value) => value!.isEmpty
                        ? 'ادخل الاسم الاول'
                        : (nameRegExp.hasMatch(value) ? null : 'ادخل اسم صحيح'),
                    onChanged: (fN) => firstName = fN,
                    decoration:
                        AppConst.inputDeco.copyWith(hintText: "الأسم الأول"),
                  ),
                  TextFormField(
                    onChanged: (lN) => lastName = lN,
                    validator: (value) => value!.isEmpty
                        ? 'ادخل الاسم الاخير'
                        : (nameRegExp.hasMatch(value) ? null : 'ادخل اسم صحيح'),
                    decoration:
                        AppConst.inputDeco.copyWith(hintText: "الأسم الاخير"),
                  ),
                  TextFormField(
                    onChanged: (ph) => phone = ph,
                    validator: (value) => value!.isEmpty
                        ? 'ادخل رقم الهاتف'
                        : (numberRegExp.hasMatch(value)
                            ? null
                            : 'ادخل هاتف صحيح'),
                    decoration:
                        AppConst.inputDeco.copyWith(hintText: "رقم الهاتف"),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
