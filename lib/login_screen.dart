import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:rohan_fitness/continue_button.dart';
import 'package:rohan_fitness/custom_text_field.dart';

import 'package:rohan_fitness/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login(String username, String password) async {
    try {
      var data = {
        'username': username.trim(),
        'password': password.trim(),
      };

      String url = 'http://192.168.4.189:8000/routes/api/admin/login';

      Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'}, // Set the Content-Type header to application/json
        body: jsonEncode(data), // Convert the data to JSON format
      );

      print(url);
      print(response.statusCode);
      var responseData = jsonDecode(response.body);
      print(responseData);

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
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Lottie.asset(
                  'assets/images/login.json',
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
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 28),
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
                child: Column(
                  children: [
                    // CustomTextFormField(hintText: "Full Name "),

                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       vertical: 10, horizontal: 10),
                    //   child: CustomTextFormField(
                    //       hintText: 'Phone Number ', labelText: ""),
                    // ),

                    CustomTextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          // if (!value.contains('@')) {
                          //   return 'Please enter a valid email';
                          // }
                          return null;
                        },
                        hintText: 'Email ',
                        labelText: ""),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: CustomTextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 3) {
                              return 'Password must be at least 3 characters';
                            }
                            return null;
                          },
                          hintText: 'Password ',
                          labelText: ""),
                    ),
                  ],
                ),
              ),
              ContinueButton(
                text: "Login",
                onPressed: () {
                  final form = formKey.currentState;
                  login(
                    emailController.text,
                    passwordController.text,
                  );
                  // if (form!.validate()) {
                  //
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const HomeScreen(),
                  //   ),
                  // );
                  //}
                },
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Text("Sign Up"))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
