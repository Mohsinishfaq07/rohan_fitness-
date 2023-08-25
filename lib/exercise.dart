import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:rohan_fitness/muscles_building.dart';
import 'package:rohan_fitness/fitness_training.dart';

import 'fat_lose.dart';

class Exercise extends StatelessWidget {
  Exercise({Key? key}) : super(key: key);

  final List<Map<String, String>> lottieData = [
    {
      'title': 'Fitness Training',
      'file': 'assets/images/fitnessExercise.json',
    },
    {
      'title': 'Muscles Building',
      'file': 'assets/images/muscles.json',
    },
    {
      'title': 'Fat Lose',
      'file': 'assets/images/exercise.json',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CarouselSlider(
                  items: lottieData.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (item['title'] == 'Fitness Training') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FitnessTraining(),
                                      ),
                                    );
                                  } else if (item['title'] == 'Muscles Building') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MusclesBuilding(),
                                      ),
                                    );
                                  } else if (item['title'] == 'Fat Lose') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FatLoose(),
                                      ),
                                    );
                                  }
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      item['title']!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Lottie.asset(
                                      item['file']!,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.8,
                    viewportFraction: 1.4,
                    aspectRatio: 15 / 9,
                    autoPlay: false,
                    enlargeCenterPage: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
