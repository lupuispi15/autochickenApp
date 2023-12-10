import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class BotonEncender extends StatefulWidget {
  const BotonEncender({super.key});

  @override
  State<BotonEncender> createState() => _BotonEncenderState();
}

class _BotonEncenderState extends State<BotonEncender> {
  late DatabaseReference _controlesRef;

  @override
  void initState() {
    super.initState();
    // Inicializa la referencia a la ubicación en la base de datos
    _controlesRef = FirebaseDatabase.instance.ref().child('controles').child('abriragua');
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 60,
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 6, 132, 14))
        ),   
        onPressed: () {
         
          int datoAEnviar = 1; 
          enviarADatabase(datoAEnviar);
        },
        child: const Text('Dispensar agua'),
      ),
    );
  }
  void enviarADatabase(int valor) {
    _controlesRef.set(valor);
  }
}