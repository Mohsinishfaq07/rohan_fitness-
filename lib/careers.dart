import 'package:flutter/material.dart';

class Careers extends StatelessWidget {
  const Careers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('careers'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(160),
                            color: Colors.black),
                        child: const Center(
                            child: Text(
                          "1",
                          style: TextStyle(color: Colors.white),
                        ))),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.28,
                      width: MediaQuery.of(context).size.width * 0.84,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.red),
                      child: const Center(child: Text("HUMAN RESOURCE")),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(160),
                            color: Colors.black),
                        child: const Center(
                            child: Text(
                          "2",
                          style: TextStyle(color: Colors.white),
                        ))),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.28,
                      width: MediaQuery.of(context).size.width * 0.84,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.red),
                      child: const Center(child: Text("FITNESS TRAINER")),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(160),
                            color: Colors.black),
                        child: const Center(
                            child: Text(
                          "3",
                          style: TextStyle(color: Colors.white),
                        ))),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.28,
                      width: MediaQuery.of(context).size.width * 0.84,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.red),
                      child: const Center(child: Text("SWEEPER")),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(160),
                            color: Colors.black),
                        child: const Center(
                            child: Text(
                          "4",
                          style: TextStyle(color: Colors.white),
                        ))),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.28,
                      width: MediaQuery.of(context).size.width * 0.84,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.red),
                      child: const Center(child: Text("WATCH MAN")),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
