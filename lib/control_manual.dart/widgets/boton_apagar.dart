import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class BotonApagar extends StatefulWidget {
  const BotonApagar({super.key});

  @override
  State<BotonApagar> createState() => _BotonApagarState();
}

class _BotonApagarState extends State<BotonApagar> {
  late DatabaseReference _controlesRef;

  @override
  void initState() {
    super.initState();
    _controlesRef = FirebaseDatabase.instance.ref().child('controles').child('abriragua');
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 60,
      child: ElevatedButton(
        style: const ButtonStyle(
         backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 211, 50, 22))
        ),
          onPressed: () {
            // Lógica para enviar un entero a Firebase
            int datoAEnviar = 0; // Puedes cambiar este valor según tus necesidades
            enviarADatabase(datoAEnviar);
          },
          child: const Text('cerrar dispensador de agua'),
        ),
    );
  }
  void enviarADatabase(int valor) {
    _controlesRef.set(valor);
  }
}