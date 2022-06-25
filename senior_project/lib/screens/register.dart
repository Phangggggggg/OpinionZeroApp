import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:senior_project/models/user.dart';
import '/colors/colors.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String _userName = '';
  String _passWord = '';
  String _passWordAgain = '';
  String _email = '';
  String _message = '';
  bool _autoValidate = false;
  final _formKey = GlobalKey<FormState>();

  void resetTextField() {
    usernameController.clear();
    passwordController.clear();
    passwordAgainController.clear();
    emailController.clear();
    _message = "";
  }

 bool isEmail(String em) {

  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

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
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        TextSpan(
            text: 'Sign In',
            style: TextStyle(
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.toNamed('/login');
              }),
      ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200.withOpacity(0.9999),
      body: Stack(
        children: [
          Positioned(
              right: 0,
              left: 0,
              child: Container(
                width: double.infinity,
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
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(0.0, 40, 0, 0),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          )),
                      Text('Sign up your account in order to use the app.')
                    ],
                  ),
                ),
              )),
          Positioned(
            top: 150,
            right: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  color: Colors.white),
              width: double.maxFinite,
              height: 460,
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
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9.0)),
                          labelText: "Username",
                          hintText: 'Enter your Username',
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Enter Your Username';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9.0)),
                          labelText: "Email",
                          hintText: 'Enter your Email',
                          prefixIcon: Icon(Icons.email_outlined),
                        ), 
                        validator: (input) => isEmail(input!) ? null : "Check your email",
                      
                        // validator: (text) {
                        //   if (text == null || text.isEmpty) {
                        //     return 'Enter Your Email';
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: TextFormField(
                        // keyboardType: TextInputType.emailAddress,
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
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
                      child: TextFormField(
                        // keyboardType: TextInputType.emailAddress,
                        controller: passwordAgainController,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          labelText: "Confirm Password",
                          hintText: 'Enter your Password Again',
                          prefixIcon: Icon(Icons.key),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Enter Your Password Again';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                              var repwd = passwordAgainController.text;
                              var email = emailController.text;

                              setState(() {
                                _userName = uname;
                                _passWord = pwd;
                                _passWordAgain = repwd;
                                _email = email;

                                _message = "username : $uname\nPassword : $pwd";
                                user
                                    .createUser(_email, _userName, _passWord)
                                    .then((value) {
                                  if (value) {
                                    Get.toNamed('/login');
                                  } else {
                                    setState(() {
                                      resetTextField();
                                    });
                                    print("this username is already exist.");
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text(
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
                            print(_userName);
                            print(_passWord);
                            print(_passWordAgain);
                            print(_email);
                            print(_message);
                            // Get.toNamed('/login');
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.white, fontSize: 15),
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
          )
        ],
      ),
    );
  }
}
