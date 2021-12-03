import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rzq_customer/providers/profile_provider.dart';
import 'package:rzq_customer/styles/app_const.dart';

class EditProfileScreen extends StatefulWidget {
  static const nav = "/edit_profile";
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    String? fName;
    String? lName;
    String? email;
    String? phone;
    final GlobalKey<FormState> _formKey = GlobalKey();
    return Consumer<ProfileProvider>(builder: (context, _profile, child) {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          actions: [
            TextButton(
                child: Text("حفظ"),
                onPressed: () async {
                  _formKey.currentState!.save();

                  if (_formKey.currentState!.validate())
                    _profile.updateProfile({
                      "first_name": fName,
                      "last_name": lName,
                      "email": email,
                      "phone": phone,
                    });
                  Navigator.pop(context);
                })
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 60,
                  backgroundImage: NetworkImage(
                      "https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG.png"),
                ),
              ),
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: SingleChildScrollView(
                      child: FutureBuilder(
                          future: _profile.editProfile(),
                          builder: (context, snapshot) {
                            return snapshot.connectionState ==
                                    ConnectionState.waiting
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 100.0),
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text("الأسم الأول"),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: TextFormField(
                                            onSaved: (v) => fName = v,
                                            initialValue:
                                                _profile.userData!.first_name,
                                            validator: (v) {
                                              if (fName!.isEmpty)
                                                return "ادخل الاسم الاول";
                                            },
                                            decoration: AppConst.inputDeco),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text("اسم العائلة"),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: TextFormField(
                                            onSaved: (v) => lName = v,
                                            initialValue:
                                                _profile.userData!.last_name,
                                            validator: (v) {
                                              if (lName!.isEmpty)
                                                return "ادخل الاسم الاحير";
                                            },
                                            decoration: AppConst.inputDeco),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text("رقم الهاتف"),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: TextFormField(
                                            onSaved: (v) => phone = v,
                                            initialValue:
                                                _profile.userData!.phone,
                                            validator: (v) {
                                              if (phone!.isEmpty)
                                                return "ادخل رقم الهاتف";
                                            },
                                            decoration: AppConst.inputDeco),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text("البريد الالكترونى"),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        child: TextFormField(
                                            onSaved: (v) => email = v,
                                            initialValue:
                                                _profile.userData!.email,
                                            validator: (v) {
                                              if (email!.isEmpty)
                                                return "ادخل البريد الالكترونى";
                                            },
                                            decoration: AppConst.inputDeco),
                                      ),
                                    ],
                                  );
                          })),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
