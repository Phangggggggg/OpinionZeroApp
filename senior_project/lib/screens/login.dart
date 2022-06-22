import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import '../db/user.dart';
import '/colors/colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String _userName = '';
  String _passWord = '';
  String _message = '';
  String _errText = '';
  bool _autoValidate = false;

  var user = User();
  final _formKey = GlobalKey<FormState>();

  void resetTextField() {
    usernameController.clear();
    passwordController.clear();
    _message = "";
  }

  Widget _buildRegisterWith() {
    return Center(
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
          text: 'Don\'t have account?  ',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        TextSpan(
            text: 'Register',
            style: TextStyle(
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.toNamed('/register');
              }),
      ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200.withOpacity(0.9999),
      // appBar: AppBar(
      //   title: Text(
      //     "Sign In",
      //     style: TextStyle(color: Colors.grey[800]),
      //   ),
      // ),
      body: Stack(
        children: [
          Positioned(
              right: 0,
              left: 0,
              child: Container(
                width: double.maxFinite,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    color: kLightBlue),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Container(
                      //   width: 80,
                      //   height: 80,
                      //   child: Image.asset('lib/assets/logo/logo.png')),
                      Container(
                          margin: EdgeInsets.fromLTRB(0.0, 45, 0, 0),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          )),
                      Text('Login your account in order to use the app.')
                    ],
                  ),
                ),
              )),
          Positioned(
            top: 150,
            right: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  color: Colors.white),
              width: double.maxFinite,
              height: 350,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 15, 10.0, 8.0),
                child: Form(
                  key: _formKey,
                  autovalidateMode: _autoValidate
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: TextFormField(
                          controller: usernameController,
                          // textInputAction: TextInputAc,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            labelText: "Username",
                            // errorText: _errText,
                            hintText: 'Enter your Username',
                            prefixIcon: Icon(Icons.person_outline),
                          ),

                          validator: (text) {
                            print(text);
                            if (text == null || text.isEmpty) {
                              return 'Enter Your Username';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            labelText: "Password",
                            hintText: 'Enter your Password',
                            prefixIcon: Icon(Icons.key),
                          ),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Enter Your Password';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
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
                                // validate
                                var uname = usernameController.text;
                                var pwd = passwordController.text;
                                setState(() {
                                  _userName = uname;
                                  _passWord = pwd;
                                  _message =
                                      "username : $uname\nPassword : $pwd";
                                });
                               
                        

                                // print(_userName);
                                // print(_passWord);
                                // print(_message);
                                user
                                    .authUser(_userName, _passWord)
                                    .then((value) {
                                  if (value) {
                                    Get.toNamed('/home');
                                  } else {
                                    setState(() {
                                      _autoValidate = true;
                                      resetTextField();
                                    });
                                    print("fail authentication");
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text("Fail Authentication"),
                                        content: Text(
                                            'Fail! Please Register your account first before Login'),
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
                              }
                               setState(() {
                                  _autoValidate = true;
                                });
                            },
                            child: Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: _buildRegisterWith(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
