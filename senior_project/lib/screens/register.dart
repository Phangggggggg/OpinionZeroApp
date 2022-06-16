import 'package:flutter/material.dart';

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
  String _email =''; 
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
          style: TextStyle(color: Colors.grey[800]),
        ),
      ),
      body: Container(
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
                  icon: Icon(Icons.person_outline),
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
                  icon: Icon(Icons.email_outlined),
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
                  icon: Icon(Icons.key),
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
                  icon: Icon(Icons.key),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: RaisedButton(
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
                    });
                    print(_userName);
                    print(_passWord);
                    print(_passWordAgain);
                    print(_email); 
                    print(_message);
                    // Get.toNamed('/home');

                  },
                  child: Text('Register'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
