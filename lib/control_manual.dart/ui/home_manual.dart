import 'package:autochicken/control_manual.dart/widgets/apagar_encenderfoco.dart';
import 'package:autochicken/control_manual.dart/widgets/boton_apagar.dart';
import 'package:autochicken/control_manual.dart/widgets/boton_encender.dart';
import 'package:autochicken/control_manual.dart/widgets/switch_controlmanual.dart';
import 'package:flutter/material.dart';

class Mycontrol extends StatefulWidget {
  const Mycontrol({super.key});

  @override
  State<Mycontrol> createState() => _MycontrolState();
}

class _MycontrolState extends State<Mycontrol> {
  bool focoEncendido = true; 
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
        shadowColor: Colors.purple,
        elevation: BorderSide.strokeAlignCenter, backgroundColor: Colors.deepOrange,
      ),
      body: Container(
         padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 217, 29, 70),
              Color.fromARGB(204, 157, 5, 137),
              Color.fromARGB(204, 69, 2, 69),
              Color.fromARGB(255, 85, 2, 87),
            ]
          )
        ),
        child: const Center(
          child: Column(
            children: [
              
              SizedBox(height: 20,),
             Expanded(
               child: Column(
                 children: [
                   Expanded(child: SwtichControl()),
                    Text("Dispensar agua",
                   style: TextStyle(
                     fontSize: 27,
                     fontWeight: FontWeight.bold,
                     fontStyle: FontStyle.italic
                   ),
                   ),
                   Expanded(
                      child: Row(
                        children: <Widget>[
                        BotonEncender(),
                        SizedBox(width: 60,),
                        BotonApagar(),
                        ],
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "Encendido y Apagado foco gallinero",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                        
                      ),
                    ),
                   Expanded(child: ApagarEncender()),
                   SizedBox(height: 40.0,)
                 ],
               ),
             ),         
            ],
          ),
        ),
      ),
    );
  }
}