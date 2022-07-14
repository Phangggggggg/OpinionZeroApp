import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:senior_project/models/user.dart';
import 'package:senior_project/widgets/logo_widget.dart';
import '/colors/colors.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();

  String _userName = '';
  String _passWord = '';
  String _email = '';
  String _message = '';
  String _phone = '';
  String _fullname = '';
  String _birthday = '';

  bool _autoValidate = false;
  final _formKey = GlobalKey<FormState>();
  final format = DateFormat('yyyy-MM-dd');

  void resetTextField() {
    usernameController.clear();
    passwordController.clear();
    emailController.clear();
    fullNameController.clear();
    dateCtl.clear();
    phoneNoController.clear();
    _message = "";
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  var user = User();

  Widget _buildRegisterWith() {
    return Center(
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
          text: 'Already have an account?  ',
          style: GoogleFonts.montserrat(color: kBlackBrown),
        ),
        TextSpan(
            text: 'Sign In',
            style: GoogleFonts.montserrat(
                color: kBlue, fontWeight: FontWeight.w600),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.toNamed('/login');
              }),
      ])),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Register Confirmation",
            style: TextStyle(color: kBlackBrown),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  'You are successfully register your account',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Get.toNamed('/login');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhite1,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              LogoWidget(height: 80, width: 80),
              Container(
                  margin: EdgeInsets.fromLTRB(0.0, 10, 0, 0),
                  child: Text(
                    "Sign up",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
                  )),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Text('Sign up your account in order to use the app.'),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0.0),
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Form(
                      key: _formKey,
                      autovalidateMode: _autoValidate
                          ? AutovalidateMode.onUserInteraction
                          : AutovalidateMode.disabled,
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: TextFormField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 15.0),
                                filled: true,
                                iconColor: kDarkBlue,
                                fillColor: kWhite,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kWhite, width: 2.0),
                                    borderRadius: BorderRadius.circular(15.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kWhite, width: 2.0),
                                    borderRadius: BorderRadius.circular(15.0)),
                                labelText: "Username",
                                hintText: 'Enter your Username',
                                prefixIcon: Icon(Icons.person_outline),
                              ),
                              style: TextStyle(fontSize: 15),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Enter Your Username';
                                }
                                return null;
                              },
                            ),
                          ),
                          Row(children: [
                            Flexible(
                                child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: TextFormField(
                                controller: fullNameController,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 15.0),
                                  filled: true,
                                  iconColor: kDarkBlue,
                                  fillColor: kWhite,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kWhite, width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kWhite, width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  labelText: "Full Name",
                                  hintText: 'Enter your Full Name',
                                  prefixIcon: Icon(Icons.account_box_outlined),
                                ),
                                style: TextStyle(fontSize: 15),
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Enter Your Full Name';
                                  }
                                  return null;
                                },
                              ),
                            )),
                            Flexible(
                              child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: DateTimeField(
                                    controller: dateCtl,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 15.0),
                                      filled: true,
                                      iconColor: kDarkBlue,
                                      fillColor: kWhite,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kWhite, width: 2.0),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kWhite, width: 2.0),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      labelText: "Birthday",
                                      hintText: 'Your Date of Birth',
                                      prefixIcon:
                                          Icon(Icons.calendar_month_outlined),
                                    ),
                                    style: TextStyle(fontSize: 15),
                                    format: format,
                                    onShowPicker:
                                        (context, currentValue) async {
                                      final date = showDatePicker(
                                        builder: (context, child) {
                                          return Theme(
                                            data: Theme.of(context).copyWith(
                                              colorScheme: ColorScheme.light(
                                                primary:
                                                    kBlue, // header background color
                                                onPrimary:
                                                    kWhite, // header text color
                                                onSurface:
                                                    kBlackBrown, // body text color
                                              ),
                                              textButtonTheme:
                                                  TextButtonThemeData(
                                                style: TextButton.styleFrom(
                                                  primary:
                                                      kBlackBrown, // button text color
                                                ),
                                              ),
                                            ),
                                            child: child!,
                                          );
                                        },
                                        context: context,
                                        initialDate:
                                            currentValue ?? DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
                                      );

                                      return date;
                                    },
                                    validator: (text) {
                                      if (text == null) {
                                        return 'Enter your Birthday';
                                      }
                                      return null;
                                    },
                                  )),
                            ),
                          ]),
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: TextFormField(
                                    controller: phoneNoController,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 15.0),
                                      filled: true,
                                      iconColor: kDarkBlue,
                                      fillColor: kWhite,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kWhite, width: 2.0),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kWhite, width: 2.0),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      labelText: "Phone Number",
                                      hintText: 'Enter your Phone Number',
                                      prefixIcon:
                                          Icon(Icons.add_ic_call_outlined),
                                    ),
                                    style: TextStyle(fontSize: 15),
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return 'Enter your Phone Number';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 15.0),
                                filled: true,
                                iconColor: kDarkBlue,
                                fillColor: kWhite,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kWhite, width: 2.0),
                                    borderRadius: BorderRadius.circular(15.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: kWhite, width: 2.0),
                                    borderRadius: BorderRadius.circular(15.0)),
                                labelText: "Email",
                                hintText: 'Enter your Email',
                                prefixIcon: Icon(Icons.email_outlined),
                              ),
                              style: TextStyle(fontSize: 15),
                              validator: (input) =>
                                  isEmail(input!) ? null : "Check your email",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: TextFormField(
                              // keyboardType: TextInputType.emailAddress,
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                filled: true,
                                iconColor: kDarkBlue,
                                fillColor: kWhite,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: kWhite, width: 2.0),
                                    borderRadius: BorderRadius.circular(15.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: kWhite, width: 2.0),
                                    borderRadius: BorderRadius.circular(15.0)),
                                labelText: "Password",
                                hintText: 'Enter your Password',
                                prefixIcon: const Icon(Icons.key),
                              ),

                              style: const TextStyle(fontSize: 15),

                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Enter Your Password';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Center(
                              child: MaterialButton(
                                minWidth: 300.0,
                                height: 50.0,
                                color: kDarkBlue,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    var uname = usernameController.text;
                                    var pwd = passwordController.text;
                                    var email = emailController.text;
                                    var phone = phoneNoController.text;
                                    var fullname = fullNameController.text;
                                    var birthday = dateCtl.text;

                                    setState(() {
                                      _userName = uname;
                                      _passWord = pwd;
                                      _email = email;
                                      _phone = phone;
                                      _fullname = fullname;
                                      _birthday = birthday;

                                      _message =
                                          "username : $uname\nPassword : $pwd";
                                      user
                                          .createUser(
                                        _email,
                                        _userName,
                                        _passWord,
                                        _fullname,
                                        _birthday,
                                        _phone,
                                      )
                                          .then((value) {
                                        if (value) {
                                          _showMyDialog();
                                        } else {
                                          setState(() {
                                            resetTextField();
                                          });
                                          print(
                                              "this username is already exist.");
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: const Text(
                                                  "Fail Username Already Exists"),
                                              content: Text(
                                                  'Fail! Can\'t create new user account. Username already exists'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    child: Text('OK'))
                                              ],
                                            ),
                                          );
                                        }
                                      });
                                    });
                                  }
                                  setState(() {
                                    _autoValidate = true;
                                  });

                                  print(dateCtl);

                                  // Get.toNamed('/login');
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                            child: _buildRegisterWith(),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
