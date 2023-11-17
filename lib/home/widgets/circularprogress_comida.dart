import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularwidgetFood extends StatefulWidget {
  const CircularwidgetFood({super.key});

  @override
  State<CircularwidgetFood> createState() => _CircularwidgetState();
}

class _CircularwidgetState extends State<CircularwidgetFood> {
  @override
  Widget build(BuildContext context) {
   return CircularPercentIndicator(
       radius: 70,
       lineWidth: 13.0,
       animation: true,
       percent: 0.7,
       center: const Text(
         "70.0%",
         style: TextStyle(
           fontWeight: FontWeight.bold, fontSize: 20.0
          ),
        ),
       footer: const Text(
         "Comida disponible",
         style: TextStyle(
           fontWeight: FontWeight.bold,
           fontSize: 17.0
          ),
        ),
       circularStrokeCap: CircularStrokeCap.round,
       progressColor: const Color.fromARGB(255, 221, 168, 20),
      
   );
  }
}