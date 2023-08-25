import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MealOne extends StatelessWidget {
  const MealOne({Key? key}) : super(key: key);

  Future<List<dynamic>> fetchData() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

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
        title: const Text("Meal One"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.purple),
              borderRadius: BorderRadius.circular(12)),
          child: FutureBuilder<List<dynamic>>(
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
                      for (var item in data)
                        ListTile(
                          title: Text(
                            item['title'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(item['body']),
                        ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
