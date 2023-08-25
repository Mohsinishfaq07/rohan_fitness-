import 'package:flutter/material.dart';

class MealSix extends StatelessWidget {
  const MealSix({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Six"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.greenAccent),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Time",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(":"),
                      Text("5:00 AM"),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Egg white(Boiled)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(":"),
                      Text("5"),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Brown bread",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(":"),
                      Text("4"),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "peanut butter",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(":"),
                      Text("4"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
