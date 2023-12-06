import 'package:flutter/material.dart';

class Mycontrol extends StatefulWidget {
  const Mycontrol({super.key});

  @override
  State<Mycontrol> createState() => _MycontrolState();
}

class _MycontrolState extends State<Mycontrol> {
  bool focoEncendido = true; // Estado inicial del foco

  void toggleFoco() {
    setState(() {
      focoEncendido = !focoEncendido;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: const Text("Control manual"),
      ),
      body: Column(
        children: [
           IconButton(
              icon: Icon(
                focoEncendido ? Icons.lightbulb : Icons.lightbulb_outline,
                size: 48.0,
              ),
              onPressed: () {
                // Lógica para cambiar el estado del foco al presionar el botón
                toggleFoco();
                // Puedes agregar aquí la lógica para apagar el foco
              },
              color: focoEncendido ? Colors.yellow : Colors.grey,
            ),
            Text(
              focoEncendido ? 'Foco Encendido' : 'Foco Apagado',
              style: TextStyle(fontSize: 20.0),
            ),
        ],
      ),
    );
  }
}