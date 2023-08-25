import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rohan_fitness/careers.dart';
import 'package:rohan_fitness/exercise.dart';
import 'package:rohan_fitness/meals.dart';
import 'package:rohan_fitness/partnership.dart';
import 'package:rohan_fitness/task_manager.dart';

import 'gym_nearby.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rohan Fitness"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Diet Plans",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              GestureDetector(onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MealsScreen()));
              },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 180,
                  width: 300,
                  child: Center(

                    child: Lottie.asset(
                      'assets/images/diet.json',
                    ),
                  ),
                ),
              ),
              const Text(
                "Exercise",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exercise()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 180,
                  width: 300,
                  child: Center(
                    child: Lottie.asset(
                      'assets/images/exercise.json',
                    ),
                  ),
                ),
              ),
              const Text(
                "Partnership",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 180,
                width: 300,
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  const PartnerShip()));
                    },
                    child: Lottie.asset(
                      'assets/images/partnership.json',
                    ),
                  ),
                ),
              ),
              const Text(
                "Careers",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 180,
                width: 300,
                child: Center(
                  child: GestureDetector(

                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>  const Careers()));

                    },
                    child: Lottie.asset(
                      'assets/images/jobs.json',
                    ),
                  ),
                ),
              ),
              const Text(
                "GYM Finder",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 180,
                width: 300,
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>    NearbyLocationsScreen()));

                    },

                    child: Lottie.asset(
                      'assets/images/maps.json',
                    ),
                  ),
                ),
              ),
              const Text(
                "Membership",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 180,
                width: 300,
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>    TaskManager()));

                    },

                    child: Lottie.asset(
                      'assets/images/bill.json',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
