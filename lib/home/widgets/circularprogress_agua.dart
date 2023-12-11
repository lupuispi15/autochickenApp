import 'dart:async';

import 'package:autochicken/firebase_conexion/firebase_con.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularwidgetWater extends StatefulWidget {
  const CircularwidgetWater({super.key});

  @override
  State<CircularwidgetWater> createState() => _CircularwidgetWaterState();
}

class _CircularwidgetWaterState extends State<CircularwidgetWater> {
  double? aguaFuture = 0.0;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    //actualizarDatosAgua(); // Llamada inicial
    timer = Timer.periodic(const Duration(seconds: 10), (Timer t) {
      // Actualiza cada 5 minutos
      actualizarDatosAgua();
    });
  }

  @override
  void dispose() {
    timer.cancel(); // Cancela el temporizador al destruir el widget
    super.dispose();
  }

  Future<void> actualizarDatosAgua() async {
    try {
      double? data = await Firebasefunciones().getAgua();
      setState(() {
        aguaFuture = data;
      });
      // ignore: empty_catches
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    if (aguaFuture! < 0.0 || aguaFuture! > 1.0) {
      aguaFuture = 0.0;
    }
    return CircularPercentIndicator(
      radius: 70,
      lineWidth: 13.0,
      animation: true,
      percent: aguaFuture!,
      center: Text(
        "${(aguaFuture! * 100).toStringAsFixed(1)}%",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      footer: const Text(
        "Agua disponible",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17.0,
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.lightBlue,
    );
  }
}
