import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularwidgetWater extends StatefulWidget {
  const CircularwidgetWater({super.key});

  @override
  State<CircularwidgetWater> createState() => _CircularwidgetWaterState();
}

class _CircularwidgetWaterState extends State<CircularwidgetWater> {
  @override
  Widget build(BuildContext context) {
    return  CircularPercentIndicator(
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
         "Agua disponible",
         style: TextStyle(
           fontWeight: FontWeight.bold,
           fontSize: 17.0
          ),
        ),
       circularStrokeCap: CircularStrokeCap.round,
       progressColor: Colors.lightBlue,
      
    );
  }
}