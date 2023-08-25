import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:rohan_fitness/continue_button.dart';
import 'package:rohan_fitness/custom_text_field.dart';
import 'package:rohan_fitness/home_screen.dart';
import 'package:rohan_fitness/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void signUp(String email, String password) async {
    try {
      Response response = await post(
        Uri.parse("https://reqres.in/api/register"),
        body: {'email': email, 'password': password},
      );
      var data = jsonDecode(response.body.toString());
      print(data['token']);

      if (response.statusCode == 200) {
        print('account created successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Lottie.asset(
                  'assets/images/signUp.json',
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.0003,
                    width: MediaQuery.of(context).size.width * 0.1,
                    color: Colors.white,
                  ),
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.0003,
                    width: MediaQuery.of(context).size.width * 0.47,
                    color: Colors.white,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: emailController,
                        hintText: 'Email',
                        labelText: "",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: CustomTextFormField(
                          controller: passwordController,
                          hintText: 'Password',
                          labelText: "",
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 4) {
                              return 'Password must be at least 4 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.29,
                            child: ContinueButton(
                              text: "Owner",
                              onPressed: () {
                                final form = formKey.currentState;
                                if (form!.validate()) {
                                  signUp(
                                    emailController.text,
                                    passwordController.text,
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height *
                                    0.0003,
                                width: MediaQuery.of(context).size.width * 0.10,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(13.0),
                                child: Text(
                                  "OR",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height *
                                    0.0003,
                                width: MediaQuery.of(context).size.width * 0.10,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.29,
                            child: ContinueButton(
                              text: "Member",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
