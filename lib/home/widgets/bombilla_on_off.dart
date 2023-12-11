import 'dart:async';

import 'package:autochicken/firebase_conexion/firebase_con.dart';
import 'package:flutter/material.dart';

class MyFoco extends StatefulWidget {
  const MyFoco({super.key});

  @override
  State<MyFoco> createState() => _MyFocoState();
}

class _MyFocoState extends State<MyFoco> {
  int? valorFoco=0;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    _actualizarValorFoco();
    timer = Timer.periodic(const Duration(seconds: 2), (Timer t) {
      // Actualiza cada 5 minutos
      _actualizarValorFoco();
    });
  }
   @override
  void dispose() {
    timer.cancel(); // Cancela el temporizador al destruir el widget
    super.dispose();
  }
   Future<void> _actualizarValorFoco() async {
    try {
      int? foco = await Firebasefunciones().getFoco();
        setState(() {
          valorFoco = foco;
        });
      
    } catch (error) {
      print('Error al obtener el valor del foco: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: 100,
      height: 116,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
        child: Column(
          children: [
             Icon(
              Icons.lightbulb,
              size: 100.0,  // Ajusta el tamaño según tus preferencias
              color: valorFoco == 1 ? const Color.fromARGB(255, 5, 147, 7) : const Color.fromARGB(255, 201, 3, 3),
            ),
            Text(
              valorFoco==1 ? 'Encendido' : 'Apagado',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      
    );
  }
}