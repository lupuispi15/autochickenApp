import 'package:flutter/material.dart';

class ConfiguracionManualScreen extends StatefulWidget {
  const ConfiguracionManualScreen({super.key});

  @override
  _ConfiguracionManualScreenState createState() =>
      _ConfiguracionManualScreenState();
}

class _ConfiguracionManualScreenState extends State<ConfiguracionManualScreen> {
  bool _mostrarBotones = false;

  void _imprimirEnConsola(String mensaje) {
    print(mensaje);
  }

  Widget _crearSeccion(String titulo, List<Map<String, String>> botones) {
    return Visibility(
      visible: _mostrarBotones,
      child: Card(
        child: Column(
          children: [
            Text(titulo,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...botones.map((boton) => ElevatedButton(
                  onPressed: () => _imprimirEnConsola(boton['accion']!),
                  child: Text(boton['texto']!),
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración Manual'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              setState(() {
                _mostrarBotones = !_mostrarBotones;
              });
            },
            child: Text(_mostrarBotones ? 'Desactivar' : 'Activar'),
          ),
          _crearSeccion('Gestión Comida', [
            {'texto': 'Dar Comida', 'accion': 'Dar Comida Presionado'},
            {'texto': 'Cerrar Comida', 'accion': 'Cerrar Comida Presionado'},
          ]),
          _crearSeccion('Gestión Agua', [
            {'texto': 'Dar Agua', 'accion': 'Dar Agua Presionado'},
            {'texto': 'Cerrar Agua', 'accion': 'Cerrar Agua Presionado'},
          ]),
          _crearSeccion('Gestión Luminaria', [
            {'texto': 'Encender', 'accion': 'Encender Presionado'},
            {'texto': 'Apagar', 'accion': 'Apagar Presionado'},
          ]),
        ],
      ),
    );
  }
}
