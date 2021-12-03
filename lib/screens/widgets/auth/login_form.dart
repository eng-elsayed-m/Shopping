import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rzq_customer/model/api/api_response.dart';
import 'package:rzq_customer/providers/authentication_provider.dart';
import 'package:rzq_customer/screens/auth/verification_screen.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
    with SingleTickerProviderStateMixin {
  CountryCode? _country = CountryCode.fromCountryCode("EG");
  TextEditingController _accountIdController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool _isEmail = false;
  void onTabChange(int i) {
    _isEmail = i == 0 ? false : true;
  }

  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _controller!.addListener(() {
      onTabChange(_controller!.index);
      _accountIdController.clear();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
    _accountIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Consumer<AuthenticationProvider>(
        builder: (context, auth, child) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 35),
              child: Material(
                color: Colors.white,
                elevation: 3,
                child: TabBar(
                  controller: _controller,
                  indicator: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                  tabs: [
                    Tab(
                      child: FittedBox(
                          child: Text(
                        "رقم الهاتف 📱",
                        style: Theme.of(context).textTheme.bodyText2,
                      )),
                    ),
                    Tab(
                      child: FittedBox(
                          child: Text("البريد الإلكتروني 📧",
                              style: Theme.of(context).textTheme.bodyText2)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                width: screenSize.width * 0.8,
                height: screenSize.height * 0.1,
                child: TabBarView(
                  controller: _controller,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          flex: 4,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.left,
                            style: TextStyle(letterSpacing: 3),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "ادخل رقم الهاتف";
                              }
                              if (value.length < 10) {
                                return "ادخل رقم هاتف صحيح";
                              }
                            },
                            controller: _accountIdController,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(letterSpacing: 3),
                                hintText: "12 3456 6789",
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                border: InputBorder.none),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CountryCodePicker(
                            initialSelection: _country!.code,
                            textStyle: TextStyle(
                              fontFamily: 'Droid',
                              fontSize: 20,
                            ),
                            padding: EdgeInsets.zero,
                            showFlagDialog: false,
                            showFlag: false,
                            onChanged: (CountryCode country) {
                              setState(() => _country = country);
                            },
                            showOnlyCountryWhenClosed: false,
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: _accountIdController,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.left,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ادخل البريد الإلكترونى";
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "example@email.com",
                          alignLabelWithHint: true,
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          border: InputBorder.none),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                  width: screenSize.width * 0.8,
                  height: screenSize.height * 0.06,
                  child: ElevatedButton(
                      child: Text("دخول"),
                      onPressed: () async {
                        String accId = _isEmail
                            ? _accountIdController.text
                            : _country!.dialCode! + _accountIdController.text;
                        String authM = _isEmail ? "email" : "phone";
                        if (_formKey.currentState!.validate())
                          await auth.login({
                            "authentication_method": authM,
                            authM: accId,
                          }).then((value) {
                            if (auth.response.status == Status.ERROR) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(auth.response.message!),
                              ));
                            } else {
                              Navigator.pushNamed(
                                  context, VerificationScreen.nv);
                            }
                          });
                      })),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                  width: screenSize.width * 0.8,
                  height: screenSize.height * 0.06,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).colorScheme.secondary),
                    ),
                    child: Text("انشاء حساب"),
                    onPressed: () {},
                  )),
            ),
            if (auth.response.status == Status.LOADING)
              SizedBox(
                width: 150,
                height: 20,
                child: LinearProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
