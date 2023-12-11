import 'dart:async';

import 'package:autochicken/firebase_conexion/firebase_con.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularwidgetFood extends StatefulWidget {
  const CircularwidgetFood({super.key});

  @override
  State<CircularwidgetFood> createState() => _CircularwidgetFoodState();
}

class _CircularwidgetFoodState extends State<CircularwidgetFood> {
  late Future<double?> comidaFuture = Future.value(null);
  late Timer timer;
  @override
  void initState() {
    super.initState();
    actualizarDatos(); // Llamada inicial
    timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
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
        comidaFuture = Future.value(datas);
      });
      // ignore: empty_catches
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<double?>(
      future: comidaFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mientras espera, puedes mostrar un indicador de carga o algo similar.
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Si hay un error, puedes mostrar un mensaje de error.
          return Text('Error: ${snapshot.error}');
        } else {
          // Si la operación fue exitosa, usa el valor en el CircularPercentIndicator.
          double percents = snapshot.data ?? 0.0;
          if (percents < 0.0 || percents > 1.0) {
            percents = 0.0;
          }
          return CircularPercentIndicator(
            radius: 70,
            lineWidth: 13.0,
            animation: true,
            percent: percents,
            center: Text(
              "${(percents * 100).toStringAsFixed(1)}%",
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
      },
    );
  }
}
