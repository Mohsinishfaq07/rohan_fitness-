import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MealThree extends StatefulWidget {
  const MealThree({Key? key}) : super(key: key);

  @override
  _MealThreeState createState() => _MealThreeState();
}

class _MealThreeState extends State<MealThree> {
  List<dynamic> dietPlan = [];

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      setState(() {
        dietPlan = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Three"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: dietPlan.map((item) => buildDietPlanItem(item)).toList(),
        ),
      ),
    );
  }

  Widget buildDietPlanItem(dynamic item) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.greenAccent),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ID:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Complain:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Details:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['id'].toString()),
                  SizedBox(
                      width: 200,
                      child: Text(
                        item['title'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: 200,
                    child: Text(item['body']),
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
