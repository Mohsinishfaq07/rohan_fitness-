import 'package:flutter/material.dart';

class MealFour extends StatelessWidget {
  const MealFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Four "),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          // height: MediaQuery.of(context).size.height * 0.8,
          // width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.greenAccent),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Time",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Egg white(Boiled)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Brown bread",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "peanut butter",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(":"),
                  Text(":"),
                  Text(":"),
                  Text(":"),
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("5:00 AM"),
                  Text("5"),
                  Text("4"),
                  Text("4"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
