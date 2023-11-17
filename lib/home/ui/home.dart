
import 'package:autochicken/home/widgets/futurewidget.dart';
import 'package:autochicken/home/widgets/circularprogress_agua.dart';
import 'package:autochicken/home/widgets/circularprogress_comida.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  

  @override
  State<HomeApp> createState() => _HomeAppState();
  
}

class _HomeAppState extends State<HomeApp> {
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
       child: const Column(
         children: [
             Expanded(
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  CircularwidgetFood(),
                  CircularwidgetWater()
                ],  
              ),
            ),
            
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  CircularwidgetFood(),
                  CircularwidgetWater()
                ],  
              ),
            ),
            Expanded(
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
               children: <Widget>[
                Myfuture(),
                Myfuture()
               ],
              )
            )
            
          ],
        ), 
      )   
    );
  }
}