import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:senior_project/utils/user_shared_preference.dart';
import 'package:senior_project/widgets/logo_widget.dart';
import '../models/user.dart';
import '/colors/colors.dart';
import 'package:google_fonts/google_fonts.dart'; 

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
          text: 'Don\'t have an account?  ',
          style: GoogleFonts.montserrat(color: kBlackBrown) ,
        ),
        TextSpan(
            text: 'Sign Up',
            style: GoogleFonts.montserrat(color: kBlue,fontWeight: FontWeight.w600) ,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.toNamed('/register');
              }),
      ])),
    );
  }

  Widget _buildLoginText() {
    return Column(
      children: [
        Text("Welcome!",style: 
        TextStyle(color: kBlackBrown,fontSize: 36, fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Text("To continue using this app,"),
        Text("please sign in first.")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhite1,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                SizedBox(height: 56,),
                Container( margin: const EdgeInsets.all(20),child: _buildLoginText()),
                LogoWidget(height: 160, width: 160),
                              // SizedBox(height: 26,),
                Container(
                  margin: const EdgeInsets.fromLTRB(30.0,8.0,20.0,10.0),
                  height: MediaQuery.of(context).size.height,
                  child: Form(
                    key: _formKey,
                    autovalidateMode: _autoValidate
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode.disabled,
                    child: ListView(children: [
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: TextFormField(
                          
                          controller: usernameController,
                          decoration: InputDecoration(
                                                      filled: true,
                                      

                           fillColor: kWhite,
                            focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kWhite, width: 2.0),
                  borderRadius: BorderRadius.circular(15.0)
                ),
                              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kWhite, width: 2.0),
                  borderRadius: BorderRadius.circular(15.0)
                ),
                            labelText: "Username",
                            // errorText: _errText,
                            hintText: 'Enter your Username',
                            prefixIcon: Icon(Icons.person_outline, ),
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
                                                      filled: true,
                              
                             fillColor: kWhite,
                             iconColor: kBlue,
                              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kWhite, width: 2.0),
                  borderRadius: BorderRadius.circular(15.0)
                ),
                              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kWhite, width: 2.0),
                  borderRadius: BorderRadius.circular(15.0)
                ),
                         
                 
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

                              user
                                  .authUser(_userName, _passWord)
                                  .then((value) {
                                if (value) {
                                
                                  print(UserSharedPreference.getUser()
                                      .toString());
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: _buildRegisterWith(),
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
