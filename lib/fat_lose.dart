import 'package:flutter/material.dart';

class FatLoose extends StatelessWidget {
  const FatLoose({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(title: Text("Fat Loose"),),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                    child: const Center(child: Text("ARMS DAY +  Running  +  ABS")),
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
                    child: const Center(child: Text("LEGS +  STRENGTH  +  ABS")),
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
                    child: const Center(child: Text("CHEST +  YOGA  +  ABS")),
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
                    child: const Center(child: Text("SHOULDERS +  SIDES  +  ABS")),
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
                            "5",
                            style: TextStyle(color: Colors.white),
                          ))),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.28,
                    width: MediaQuery.of(context).size.width * 0.84,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.red),
                    child: const Center(child: Text("BACK   +  MIX  +  ABS")),
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
