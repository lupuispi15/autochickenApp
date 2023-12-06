
import 'package:autochicken/control_manual.dart/ui/home_manual.dart';
import 'package:autochicken/home/widgets/bombilla_on_off.dart';
import 'package:autochicken/home/widgets/circularprogress_comida2.dart';
import 'package:autochicken/home/widgets/tempWidget.dart';
import 'package:autochicken/home/widgets/circularprogress_agua.dart';
import 'package:autochicken/home/widgets/humedadWidget.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  
  @override
  State<HomeApp> createState() => _HomeAppState();
  
}

class _HomeAppState extends State<HomeApp> {
  void cargarhome(){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autochicken'),
        shadowColor: Colors.purple,
        elevation: BorderSide.strokeAlignCenter, backgroundColor: Colors.deepOrange,
      ),
      body:  Container(
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
        child:  const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             Expanded(
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: <Widget>[
                  CircularwidgetFood2(),
                  CircularwidgetWater(),
                ],  
              ),
            ),
            SizedBox(height: 40,),
            Expanded(  
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                Tempgallinero(),
                Humgallinero()
               ],
              )
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyFoco()
                ],
              ),
            ),
          ],
        ),
      )   
    );
  }
}