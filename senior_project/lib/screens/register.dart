import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:senior_project/db/user.dart';
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
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Container(
                      //   width: 80,
                      //   height: 80,
                      //   child: Image.asset('lib/assets/logo/logo.png')),
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
              height: 450,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 15, 8.0, 8.0),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        labelText: "Username",
                        hintText: 'Enter your Username',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        labelText: "Email",
                        hintText: 'Enter your Email',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                    child: TextField(
                      // keyboardType: TextInputType.emailAddress,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        labelText: "Password",
                        hintText: 'Enter your Password',
                        prefixIcon: Icon(Icons.key),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                    child: TextField(
                      // keyboardType: TextInputType.emailAddress,
                      controller: passwordAgainController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        labelText: "Confirm Password",
                        hintText: 'Enter your Password Again',
                        prefixIcon: Icon(Icons.key),
                      ),
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
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        onPressed: () {
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
                            user.createUser(_email, _userName, _passWord).then((value) {
                              if(value){
                                 Get.toNamed('/login');
                              }
                            });
                          });
                          print(_userName);
                          print(_passWord);
                          print(_passWordAgain);
                          print(_email);
                          print(_message);
                          Get.toNamed('/login');
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

          // Positioned(
          //     top: 610,
          //     right: 0,
          //     left: 90,
          //     chrild: Container(
          //       child: Text('----------------  More  ---------------- '),
          //     )),
          // Positioned(
          //     top: 580,
          //     right: 0,
          //     left: 140,
          //     child: Container(
          //       // margin: EdgeInsets.all(10),
          //       // decoration: BoxDecoration(
          //       //     borderRadius: BorderRadius.all(Radius.circular(30.0)),
          //       //     color: Colors.white),
          //       width: double.infinity,
          //       height: 70,
          //       child: Row(
          //         crossAxisAlignment: CrossAxisAlignment.stretch,
          //         children: [
          //           IconButton(
          //               icon: Icon(Icons.email, size: 40), onPressed: () {}),
          //           IconButton(
          //               icon: Icon(Icons.facebook, size: 40), onPressed: () {})
          //         ],
          //       ),
          //     ))
        ],
      ),
    );
  }
}
