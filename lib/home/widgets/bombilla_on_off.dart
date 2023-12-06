import 'package:flutter/material.dart';

class MyFoco extends StatefulWidget {
  const MyFoco({super.key});

  @override
  State<MyFoco> createState() => _MyFocoState();
}

class _MyFocoState extends State<MyFoco> {
  bool isFocoEncendido = true;
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
              color: isFocoEncendido ? const Color.fromARGB(255, 5, 147, 7) : const Color.fromARGB(255, 201, 3, 3),
            ),
            Text(
              isFocoEncendido ? 'Encendido' : 'Apagado',
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