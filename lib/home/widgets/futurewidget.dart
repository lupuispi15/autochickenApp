import 'package:autochicken/firebase_conexion/firebase_con.dart';
import 'package:flutter/material.dart';

class Myfuture extends StatefulWidget {
  const Myfuture({super.key});

  @override
  State<Myfuture> createState() => _MyfutureState();
}

class _MyfutureState extends State<Myfuture> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          future: getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Text(snapshot.data?[index]['temp']);
                },
              );
            } else{
             return const CircularProgressIndicator();
            }
            
          });
  }
}