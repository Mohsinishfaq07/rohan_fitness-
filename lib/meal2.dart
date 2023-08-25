import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MealTwo extends StatefulWidget {
  const MealTwo({Key? key}) : super(key: key);

  @override
  _MealTwoState createState() => _MealTwoState();
}

class _MealTwoState extends State<MealTwo> {
  Future<List<dynamic>> fetchData() async {
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=1'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Two"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<dynamic> data = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
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
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Row(
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
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(decoration: BoxDecoration(color: Colors.red,

                            borderRadius: BorderRadius.circular(12)),
                              child: Column(children: [
                                for (var item in data)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(item["id"].toString()),
                                        Column(crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(item["email"].toString())),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                              ],),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
