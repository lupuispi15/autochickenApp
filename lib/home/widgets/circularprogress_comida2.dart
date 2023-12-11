import 'dart:async';

import 'package:autochicken/firebase_conexion/firebase_con.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularwidgetFood2 extends StatefulWidget {
  const CircularwidgetFood2({super.key});

  @override
  State<CircularwidgetFood2> createState() => _CircularwidgetFood2State();
}

class _CircularwidgetFood2State extends State<CircularwidgetFood2> {
  //late Future<double?> comidaFuture = Future.value(null);
  double? comidaf = 0.0;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    actualizarDatos(); // Llamada inicial
    timer = Timer.periodic(const Duration(seconds: 10), (Timer t) {
      // Actualiza cada 5 minutos
      actualizarDatos();
    });
  }

  @override
  void dispose() {
    timer.cancel(); // Cancela el temporizador al destruir el widget
    super.dispose();
  }

  Future<void> actualizarDatos() async {
    try {
      double? datas = await Firebasefunciones().getComida();
      setState(() {
        comidaf = datas;
      });
    } catch (error) {
      // ignore: avoid_print
      print('Error al obtener datos: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (comidaf! < 0.0 || comidaf! > 1.0) {
      comidaf = 0.0;
    }
    return CircularPercentIndicator(
      radius: 70,
      lineWidth: 16.0,
      animation: true,
      percent: comidaf!,
      center: Text(
        "${(comidaf! * 100).toStringAsFixed(1)}%",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      footer: const Text(
        "Comida disponible",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17.0,
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: const Color.fromARGB(255, 244, 180, 3),
    );
  }
}
