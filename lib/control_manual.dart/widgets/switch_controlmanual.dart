import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SwtichControl extends StatefulWidget {
  const SwtichControl({super.key});

  @override
  State<SwtichControl> createState() => _SwtichControlState();
}

class _SwtichControlState extends State<SwtichControl> {
  int switchValue = 0;
   late DatabaseReference _controlesRef;

  @override
  void initState() {
    super.initState();
    _controlesRef = FirebaseDatabase.instance.ref().child('controles').child('controltotal');
  }
  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Activar el control manual',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
            ),
            ),
            Container(
              transform: Matrix4.diagonal3Values(1.7, 1.7, 2.0),
              child: Switch(
                
                value: switchValue == 1,
                onChanged: (value) {
                  setState(() {
                    switchValue = value ? 1 : 0;
                    enviarADatabase(switchValue);
                  });
                },
              ),
            ),
          ],
        );
  }
  void enviarADatabase(int valor) {
    _controlesRef.set(valor);
  }
}