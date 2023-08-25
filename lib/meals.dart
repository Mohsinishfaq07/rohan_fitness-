import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rohan_fitness/meal1.dart';
import 'meal2.dart';
import 'meal3.dart';
import 'meal4.dart';
import 'meal5.dart';
import 'meal6.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meals"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MealOne()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      height: 140,
                      width: 140,
                      child: Center(
                        child: Lottie.asset(
                          'assets/images/one.json',
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MealTwo()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepPurpleAccent,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      height: 100,
                      width: 100,
                      child: Center(
                        child: Lottie.asset(
                          'assets/images/two.json',
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MealThree()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepPurpleAccent,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      height: 100,
                      width: 100,
                      child: Center(
                        child: Lottie.asset(
                          'assets/images/three.json',
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MealFour()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueGrey,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      height: 150,
                      width: 150,
                      child: Center(
                        child: Lottie.asset(
                          'assets/images/four.json',
                        ),
                      ),
                    ),
                  ),


                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MealFive()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueGrey,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      height: 130,
                      width: 130,
                      child: Center(
                        child: Lottie.asset(
                          'assets/images/five.json',
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MealSix()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      height: 100,
                      width: 100,
                      child: Center(
                        child: Lottie.asset(
                          'assets/images/six.json',
                        ),
                      ),
                    ),
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
