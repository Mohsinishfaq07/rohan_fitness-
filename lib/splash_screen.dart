import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rohan_fitness/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SignUpScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("Rohan Fitness",style: TextStyle(fontWeight: FontWeight.bold),),
            Lottie.asset(
              'assets/images/fitness.json',
            ),
          ]),
        ),
      ),
    );
  }
}
