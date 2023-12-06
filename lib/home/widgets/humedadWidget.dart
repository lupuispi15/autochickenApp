// ignore_for_file: file_names

import 'dart:async';
import 'package:autochicken/firebase_conexion/firebase_con.dart';
import 'package:flutter/material.dart';

class Humgallinero extends StatefulWidget {
  const Humgallinero({super.key});

  @override
  State<Humgallinero> createState() => _TempState();
}

class _TempState extends State<Humgallinero> {
   double? humeFuture = 0.0;
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
      double? data = await Firebasefunciones().getHum();
      setState(() {
        humeFuture = data;
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
      width: 150,
      child: Column(
        children: [
          const Icon(
            Icons.whatshot, // Puedes cambiar el icono según la representación visual que desees
            size: 40,
            color: Colors.grey,
          ),
          const Text(
            "Humedad",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontStyle: FontStyle.italic
            )
          ),
          Text(
            '$humeFuture',
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
              fontStyle: FontStyle.italic
            ),
          )
        ],
      ),
    );
  }
}