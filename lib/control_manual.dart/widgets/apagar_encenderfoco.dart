import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ApagarEncender extends StatefulWidget {
  const ApagarEncender({super.key});

  @override
  State<ApagarEncender> createState() => _ApagarEncenderState();
}

class _ApagarEncenderState extends State<ApagarEncender> {
  bool focoEncendido = false;
    late DatabaseReference _controlesRef;

  @override
  void initState() {
    super.initState();
    _controlesRef = FirebaseDatabase.instance.ref().child('controles').child('focomanual');
  }
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 120.0,
        icon: Column(
          children: [
            Icon(
              focoEncendido ? Icons.lightbulb : Icons.lightbulb_outline,
              color: focoEncendido ? Colors.green : Colors.red,
            ),
            Text(
            focoEncendido ? 'Encendido' : 'Apagado',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          ],
        ),
        
        onPressed: () {
         
          setState(() {
            focoEncendido = !focoEncendido;
            enviarADatabase(focoEncendido ? 1 : 0);
          });
        },
      );
  }
  void enviarADatabase(int valor) {
    _controlesRef.set(valor);
  }
}