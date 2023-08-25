import 'package:flutter/material.dart';

class PartnerShip extends StatelessWidget {
  const PartnerShip({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,


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
            child: const Center(child: Text("INVESTMENT")),
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
            child: const Center(child: Text("BUY A FRANCHISE")),
          ),
        ],
      ),
    ],),),

    );
  }
}
