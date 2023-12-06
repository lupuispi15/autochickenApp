// ignore_for_file: file_names

import 'dart:async';

import 'package:autochicken/firebase_conexion/firebase_con.dart';
import 'package:flutter/material.dart';

class Tempgallinero extends StatefulWidget {
  const Tempgallinero({super.key});

  @override
  State<Tempgallinero> createState() => _TempState();
}
class _TempState extends State<Tempgallinero> {
  double? tempFuture = 0.0;
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
    double? data = await Firebasefunciones().getTemp();
    setState(() {
      tempFuture = data;
    });
    } catch (error) {
    // ignore: avoid_print
    print('Error al obtener datos: $error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 170,
      child: Column(
        children: [
          const Icon(
            Icons.wb_sunny, // Puedes cambiar el icono según la temperatura
            size: 40,
            color: Colors.orange,
          ),
          const Text("Temperatura",
            style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange
            ),
          ),
          Text(
            '$tempFuture',
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent,
              fontStyle: FontStyle.italic
            ),
          )
        ],
      ),
    );
  }
}