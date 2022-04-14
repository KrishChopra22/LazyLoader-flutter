import 'package:flutter/material.dart';

import 'controller/auth_controller.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _loginUserData = {
    'email': '',
    'password': '',
  };

  _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    print(_loginUserData);
    AuthController.login(_loginUserData);
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('asset/login.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: _formKey,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 40, top: 40),
                child: Text(
                  'Welcome Back!',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 36),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.5,
                      right: 40,
                      left: 40),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Email",
                            hintText: 'Enter email',
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _loginUserData['email'] = value!;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Password",
                            hintText: 'Enter password',
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password required!';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          _loginUserData['password'] = value!;
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xFF38B6FF),
                            child: IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {
                                _submit();
                              },
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     TextButton(
                      //         onPressed: () {
                      //           Navigator.pushNamed(context, 'signup');
                      //         },
                      //         child: Text(
                      //           'Sign Up',
                      //           style: TextStyle(
                      //               decoration: TextDecoration.underline,
                      //               fontSize: 18,
                      //               color: Colors.black),
                      //         )),
                      //     TextButton(
                      //         onPressed: () {},
                      //         child: Text(
                      //           'Forgot Password',
                      //           style: TextStyle(
                      //               decoration: TextDecoration.underline,
                      //               fontSize: 18,
                      //               color: Colors.black),
                      //         ))
                      //   ],
                      // )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
